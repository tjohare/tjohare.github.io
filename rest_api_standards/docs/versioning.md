## **API Versioning**
You may end up in situations where the above approaches don’t work and you really have to provide different versions of your API. Versioning allows you to release incompatible and breaking changes of your API under a new version without breaking the clients. They can continue consuming the old version. The clients can migrate to the new version at their own speed.

Here are the two most popular approaches for versioning:

* Versioning via URLs: /api/v1/ (**DEFAULT METHOD**)
* Versioning via the Accept HTTP Header: Accept: application/vnd.myapi.v1+json (Content Negotiation, **NOT USED**)

For Creative Drive, we use the _**Versioning via URLs**_, and the current BaseURL for the API is: /api/v1 .


## **Get the requested API version**
From any API controller (who inherits from Api\Controller\ApiController) you could get the requested version:
``` php
<?php

public function action()
{
    $version = $this->getApiVersion();
}
```
