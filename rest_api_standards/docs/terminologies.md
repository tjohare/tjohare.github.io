While a list of the standard REST API terminolgies can be found here: http://apiglossary.com, here's a short list of the most important ones you'll be using.

??? info "Resource"
    _Resource_ is an object or entity that has a URI where it can be manipulated
    through HTTP requests.  The resources has some associated data with it and
    there can be set of methods to operate on it.  

??? info "Collections"
    _Collections_ are set of resources grouped together.  

    In many ways, think of collections as the table in a database.    If you typed `Select * from divisions` you'd get all the divisions.    

    In that same paradigm, a REST API call to `GET /api/v1/divisions` returns all the divisions

??? info "Endpoint"
    _Endpoint_ is the URI that goes after the base URL and points towards the requested API functionality.  

??? info "Method"
    _Method_ is the part of an HTTP request that tells the server what the client wants to do.

    E.g. GET, POST, PUT, DELETE, PATCH

??? info "Status Code"
    _Status Code_ is the HTTP status codes are what the server sends in the response back to the client with regards to the status of the request.
