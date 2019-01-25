The RESTful Web Service should respond to a client’s request with a suitable HTTP status response code.

### **API Success Codes**
| 2xx: Success   |  Information |
| -------------- | -------------|
| 200 OK         | Standard response for successful HTTP requests. |
| 201 Created    | The request has been fulfilled, resulting in the creation of a new resource.  Use this when creating new resources. |
| 202 Accepted   | The request has been accepted for processing, but the processing has not been completed.  |
| 204 No Content | The server successfully finished processing the request and is not returning any content.  |

---

### **API Failure Codes**
| 4xx: Client Error  |  Information |
| ------------------ | -------------|
| 400 Bad Request    | The server cannot or will not process the request due to an apparent client error (e.g. malformed request, size too large, etc)
| 401 Unauthorized   | Similar to 403 Forbidden, but specifically for use when **_authentication has failed_** or has not yet been provided.
| 403 Forbidden      | The request was valid, but the server is refusing action. The user does not have the necessary permissions for a resource.
| 404 Not Found      | The requested resource could not be found but may be available in the future (e.g. getting all the assets of a user but they haven't uploaded any yet)

---

### **Server Failure Codes**
| 5xx: Server Error  |  Information |
| ------------------ | -------------|
| 500 Internal Server Error | A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.   This should **NEVER** be returned for an API Request failure.   This would be something more akin to the request being received, but the queue was full, and couldn't be added for processing. |

!!! warning "Do Not overuse 404"
    Try to be more precise. If the resource is available, but the user is not allowed to view it, return a 403 Forbidden.
