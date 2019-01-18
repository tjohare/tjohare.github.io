## Synchronous calls
Here's the accepted structure for adding a synchronous call to the Api

???+ example "Example: ApiFolderController->add()"

    ```php
    <?php
    /**
     * POST
     * Creates a new folder
     */
    public function add()
    {
        // get the payload
        $payload = $this->getPayload();

        // The next line tries to add a new folder.
        // We pass the payload to the Folder component method (add) and the validation process is done there.
        try {
            $result = $this->Folder->add($payload);
        }
        catch (\App\Exception\Payload $payloadException) {
            $requiredFieldsMessage = '';
            if (count($payloadException->getMissingRequiredFields()) > 0) {
                $requiredFieldsMessage = ' Missing required fields: ' . implode(', ', $payloadException->getMissingRequiredFields());
            }
            throw new \Api\Exception\ApiPayloadException('Payload error.' . $requiredFieldsMessage);
        }

        // set the data to output as the data returned by the folder add() operation
        $this->setOutputStatusCode(\Api\Response\Response::RESPONSE_CODE_CREATED);
        $this->setOutputData($result->getData()['TsFolder']);
    }
    ```


## Asynchronous calls

There are some actions that start a long process and the app is unable to return the output data at the moment of the call. For these cases the API follows the next steps:

1. Receives the request
1. Starts the associated process
1. Creates a unique id and associate it with the request
1. Returns a 202 code (Accepted)
1. Returns a Location field (as part of the headers) with a unique url to get the status of the call.
    *  Example: /api/v1.2/queue/577e6da072180

### **Accessing the Queue Information**
Accessing the API with the url provided in the Location header will return the status of the task and some extra fields:

```json
{"data": {
   "status": "PENDING",
   "url_origin": "/api/v1.2/folders/5",
   "payload":    {
      "accountId": 3,
      "version": "1.2",
      "id": "5",
      "[method]": "DELETE"
   }
}}

//The field payload holds the payload used in the first call.
```



There are three possible statuses:

* **PENDING** - (\Api\AsyncTask\Manager::STATUS_PENDING) The task is already running (or enqueued).
* **DONE** - (\Api\AsyncTask\Manager::STATUS_DONE) The task is done.
* **NOT FOUND** - (\Api\AsyncTask\Manager::STATUS_NOT_FOUND) The app could not find the associated task. Possible reasons: it never existed or it expired (one task exists only for 5 hours within the list after its last modification)

!!! warning "NOTE: Returning OK is not Acceptable - it must be 1 of the 3 listed above"


### **Examples of How to register and start an async task**
The method `addAsyncCall(Callable $callback)` creates an unique id for the task and calls the provided callback function. It passes two parameters to the callback:

* `$id` : The generated id
* `$location` : The api url to check the status of the task

The callback function should start the process.

???+ example
    ```php
    <?php
    public function action()
    {
        $self = $this;
        $this->addAsyncCall(function($queueId, $url) use($self){
            // $queueId => the unique id associated to this task
            $payload = $self->getPayload();
            // here you should start the long process ...
        });
    }
    ```

### **How to modify a previously registered async task status**
To modify a previously registered task, simply follow this example:

???+ example
    ```php
    <?php
    public function action()
    {
        $this->getAsyncTaskManager()->modify($id, $status, $url);
    }
    ```

## **Redirects**
Once you modify the status to DONE you could provide a final url in order to redirect the user to get the final data related to the finished task.

Then, the next time the user asks for this id it is going to be automatically redirected to the provided url (using a 303 HTTP code and a Location header).
