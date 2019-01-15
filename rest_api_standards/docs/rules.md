The following items are consolidated from multiple contributing sources and are widely considered "Best Practice" methods when it comes to REST APIs

## Summary
* [Use Plural Nouns for Collections and Sub-collections](#use-plural-nouns-for-collections-and-sub-collections)
* [2 URLS per resource](#2-urls-per-resource)
* [Use NOUNS instead of Verbs for Resources](#use-nouns-instead-of-verbs-for-resources)
* [Wrap the ACTUAL data in a data Field](#wrap-the-actual-data-in-a-data-field)
* [Use the Correct HTTP Status Codes](#use-the-correct-http-status-codes)
* [Provide Descriptive Error Messages, no contractions](#provide-descriptive-error-messages-no-contractions)
* [CamelCase for Attributes](#camelcase-for-attributes)
* [Meta Data section at TOP of responses](#meta-data-section-at-top-of-responses)
* [Namespaces](#namespaces)


### **Use Plural Nouns for Collections and Sub-collections**
Collections normally have many resources within them.   As such, you should refer to them in the PLURAL sense, such as `/assets` not `/asset`

??? success "Good Collection Name example"
    * /divisions
    * /divisions/1
    * /divisions/1/assets

??? bug "Poor Collection Name example"
    * /division
    * /division/1
    * /division/1/asset

### **2 URLS per resource**
Use 1 URL for the collection itself, and 1 URL for a single resource within that collection

??? info "Example"
    ``` js
    //URL that represents a collection of resources
    GET /api/v1/divisions      

    //URL that represents a single resource
    GET /api/v1/divisions/5
    ```


### **Use NOUNS instead of Verbs for Resources**
Keeps the number of URLs low and much simpler.   For instance, if you needed to delete all assets in a folder, you might do something like: `DELETE /folders/1/assets` and not `GET /folders/1/deleteAllFolderAssets`

??? success "Good Resource Name example"
    * `GET /api/v1/divisions` - Get all divisions
    * `DELETE /api/v1/folders` - Delete all folders
    * `POST /api/v1/assets` - Create a new asset

??? bug "Bad Resource Name example"
    * `GET /api/v1/getAllDivisions`
    * `GET /api/v1/deleteAllFolders`
    * `POST /api/v1/createAsset`

### **Wrap the ACTUAL data in a `data` Field**
When returning an object or a list of objects, the actual data for the resource should be encapsulated within a data field, because this gives us:

* Additional space left to add metadata fields, such as pagination, links, deprecation warnings, error messages, etc
* Consistency across all resources and collections
* Compatible with the JSON:API Standard at https://jsonapi.org/

??? example "Example"
    ``` JSON
    // GET /api/v1/users/2 response

    {
        "data": {
            "id": 2,
            "first_name": "Janet",
            "last_name": "Weaver",
            "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
        }
    }
    ```

### **Use the Correct HTTP Status Codes**
More often than not, developers just return a `HTTP 200 Success` when the API call works, and a `HTTP 400 Error` when the request fails.   While technically correct, they do not offer insight as to why the request failed and leads to longer debugging times and effort.    It is generally accepted universally to keep the set of status codes small but providing the correct response allows developers to follow the process easier.  

Please refer to the [HTTP Status Codes section](statuscodes.md) for example.


### **Provide Descriptive Error Messages, no contractions**
This one goes with the rule above, as you should provide a useful and VERBOSE description of the error

??? example "Verbose Message example"
    ```JSON
    // example of a 400 Bad Request
    {
      "errors": [
        {
          "status": 400,
          "message": "Invalid state. Valid values are 'internal' or 'external'"
        }
      ]
    }
    ```
Please also note that you SHOULD NOT use contractions, like `can't` or `couldn't`, within an error message

### **CamelCase for Attributes**
Use CamelCase for your attributes identifiers, starting with lowercase, such as `{ "yearOfBirth": 1982 }`

Don’t use underscores (year_of_birth) or capitalize (YearOfBirth). Often your RESTful web service will be consumed by a client written in JavaScript. Typically the client will convert the JSON response to a JavaScript object (by calling var person = JSON.parse(response) ) and call its attributes. Therefore, it’s a good idea to stick to the JavaScript convention which makes the JavaScript code more readable and intuitive.

??? success "Good example of Attributes CamelCase conventions"
    // Do
    person.yearOfBirth

??? bug "Bad example of Attributes CamelCase conventions"
    // Don't
    person.year_of_birth   // violates JavaScript convention
    person.YearOfBirth     // suggests constructor method

### **Meta Data section at TOP of responses**
Whenever optional query parameters are included in an API, a META section is required in the response output.   The correct place for this is BEFORE any data structures.   This better allows for pagination to be handled better as well as following the JSON:API Standard at https://jsonapi.org/.

??? example "Sample Meta section response"
    ``` json
    {
      "meta": {
        "offset": 20,
        "limit": 10,
        "total": 3465,
      },
      "data": [
        {
            "id": 10,
            "dateCreated": 1504224000000
        }
      ],
      "links": {
        "next": "http://www.domain.com/employees?pageSize=100&continue=1504224000000_10"
      }
    }
    ```

### **Namespaces**
* The namespace for the API is `\Api`
* The namespace for the API controllers is `\Api\Controller`
* The namespace for the API Exceptions is `\Api\Exception`
