## **How to add a new route**
Suppose you want to add the route: /api/v1/collections with the verb GET :

1. Go to app/Config/routes.php (section "API routing")
1. Add the following

!!! example
    ```php
    <?php

    Router::connect("{$apiPrefix}/collections",
        array('controller' => 'ApiCollection', 'action' => 'view',
        '[method]' => 'GET'),
        $apiOptions
    );
    ```

Add an ApiCollectionController at **app/Api/Version/V1/Controller/** with a public method view. This controller should extends **\Api\Controller\ApiController**

Note that, in this example, we define a route for the Api Version 1. We cover the way to handle different versions at Versioning section.

## **Payload**
There are more than one way to get the incoming data (from a controller who extends \Api\Controller\ApiController):

* `$this->passedArgs` Array with parameters coming directly from the route
* `$this->getPayload()` Method to get an array with all the parameters (both from the route and from the request body)
* `$this->request->header('headerField')` Method to get header values from the request

The parameters coming as part of the request body are decoded based on the ContentType header value (part of the request). At the moment we support Json.

### **Adding new Decoders for the Request Body**
To add a new decoder for the request body:

1. Create a new file at app/Api/Request/ who extends the abstract class \Api\Request\Request
1. Add the new type to \Api\Request\Manager::getRequestObject() (Ideally we should avoid this step in order to apply the Open-Close principle)

## **Output**
The way to output the response (from any Api Controller):

* `$this->setOutputStatusCode($statusCode)` Set the Response Code (200, 201, 400, ...)
* `$this->setOutputData($data)` Set the response data

There are no Views for the API. The method afterFiler (\Api\Controller\ApiController) outputs what you previously set and exits.

All the data is formatted based on the Accept header from the request. At the moment we only support Json.

### **Adding new Encoders for the Output**
To add a new encoder for the response body:

1. Create a new file at app/Api/Response/ who extends the abstract class \Api\Response\Response
1. Add the new type to \Api\Response\Manager::getResponseObject() (Ideally we should avoid this step in order to apply the Open-Close principle)
