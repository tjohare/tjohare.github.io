# Creative Drive Development REST API Guidelines & Standards

## **Introduction**

RESTful APIs are interfaces that enable applications to communicate with each other.   The role of REST APIs has expanded dramatically, where even major companies, such as Facebook, Google, Github, Netflix and a few other tech giants have given access to developers and products to consume their data through APIs, and even became a platform for them.  They can be used as an interface to the business, allowing them to monetize digital assets, extend their value proposition with partner-delivered capabilities, and connect to customers across multiple channels, tools, and devices.  

Creative Drive seeks to do the same across our own suite of applications and products.  

In order to achieve this goal while utilizing multiple development teams and products, a uniform Guidelines & Standards protocol is required.


## **Development Topics**
This document will cover the following General REST API Development areas, as well as the Creative Drive Standards and Guidelines.

### **General REST API Guidelines**  

* [General API Rules](rules.md) - Ensuring Consistency and Compatibility of the API.  
* [Terminologies](terminologies.md) - What are Resources, Collections, Endpoints, and others
* [Methods](methods.md) - The differences between GET, POST, PUT, DELETE, etc
* [Status Codes](statuscodes.md) - part of the HTTP/1.1 standard (RFC 7231)
* [Option Parameter Queries](queries.md) - appending query params with the GET method

### **Creative Drive Standards**

* [Response Types](responsetypes.md) - Making sure the correct types are enumerated in the JSON response
* [Error Response Structure](errorhandling.md) - Descriptive outputs that allows for problem solving
* [Versioning](versioning.md) - Handling Breaking changes
* [Authentication](authentication.md) - REST API Security
* [New Endpoints](newcollection.md) - How to add a new Route / Collections
* [Synchronous & Asynchronous Calls](synch_asynch.md) - Adding Synchronous and Asynchronous calls


## **Contributing Documentation and Reference Material**
* [RFC 7231](https://tools.ietf.org/html/rfc7231)
* [RFC 7807](https://tools.ietf.org/html/rfc7807)
* [List of HTTP Status Codes, Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
* [HTTP Method Definitions](https://restfulapi.net/http-methods/)
* [API Glossary](http://apiglossary.com/)
* [RESTful API Design Best Practices, by Philipp Hauer ](https://blog.philipphauer.de/restful-api-design-best-practices/)
* [Top REST API Best Practices, code-maze.com](https://code-maze.com/top-rest-api-best-practices)
* [Secrets of a Great API, Mulesoft ](https://www.mulesoft.com/ty/wp/secrets-great-api)
* [API Design Guidelines, Hackernoon.com ](https://hackernoon.com/restful-api-designing-guidelines-the-best-practices-60e1d954e7c9)
* [How a RESTful API represents resources](https://www.oreilly.com/ideas/how-a-restful-api-represents-resources)
