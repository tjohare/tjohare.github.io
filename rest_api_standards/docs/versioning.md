!!! warning "Please note that this reference of API versioning is not the same as Code under Version Control.  There could be multiple versions of a source file under a _**single**_ API version.  Version control of code is defined under the CreativeDrive Coding Standards and Guidelines; this reference is a subset and for REST APIs only (aka Multiple versions of the same application)""

## **API Versioning**

You may end up in situations where the above approaches don’t work and you really have to provide different versions of your API. Versioning allows you to release incompatible and breaking changes of your API under a new version without breaking the clients. They can continue consuming the old version. The clients can migrate to the new version at their own speed.

Here are the two most popular approaches for versioning:

* Versioning via URLs: /api/v1/ (**DEFAULT METHOD**)
* Versioning via the Accept HTTP Header: Accept: application/vnd.myapi.v1+json (Content Negotiation, **NOT USED**)

For Creative Drive, we use the _**Versioning via URLs**_, and the current BaseURL for the API is: /api/v1 .


## **Get the requested API version**
From any API controller (who inherits from Api\Controller\ApiController) you could get the requested version:

```php
<?php

public function action()
{
    $version = $this->getApiVersion();
}
```

## **Get and Set the codebase version**
Using the class \Utils\Load\Version you can set and ask for the current codebase version.

```php
<?php

// set the codebase version as 1.5
\Utils\Load\Version::setCurrentCodeVersion(1.5);

// get the current version
$currentVersion = \Utils\Load\Version::getCurrentCodeVersion();
```

The convention we use to set the current codebase version is:

1. For incoming API calls: Set the codebase version as the requested API version.
1. No-API calls: Set the codebase version as the latest available version.

Every time the app loads a Model or a Component it will use the file associated with the current version (in case that there is more than one version for the requested entity). You do not have to ask explicitly for a particular version, the app handles it for you.
Also, for every API call the app will use the controller associated with the requested version, so the models and components.

If, for any reason, the app tries to load an explicit version for a Model / Component and there is no an associated file for that version, then it attempts to load the previous available version. If there is not a previous available version, it throws an Exception.

## **Define API Versioned Controllers***

There are two main steps to define a Controller to cover an Api route:

1. Add the Controller file to app/Api/Version/Vn/Controller. The file name should be ApiResourceController.php (replace Resource by your resource name)
1. Add an entry to app/Config/klient/default/default.json

Let see an example. Suppose we need to add the version 2 for the Assets resource. Then the steps should be the following:

1. Create the file: app/Api/Version/V2/Controller/ApiAssetsController.php
1. Add an entry to app/Config/klient/default/default.json (versions > Controller > controllerName) :
      ``` json
      "versions": {
          "Controller": {
              ...
              ,
              "ApiAssets": {
                  ...
                  "2": "\\Api\\Version\\V2\\Controller\\ApiAsset"
              }
          },
          "Component": {
              ...
          },
          "Model": {
              ...
          }
      }
      ```

As we are adding a Controller for the version 2, it could be possible that there are a previous version for the same Controller (note that, in the other hand, it could be a new Controller for a new resource introduced in the version 2, so in that case there is no a previous Controller for it). Then our new Controller should inherit from the previous version Controller, in order to reuse its actions. We only rewrite the actions involved with the breaking changes related to the new version.

```PHP
<?php

namespace Api\Version\V2\Controller;

class ApiAssetsController extends \Api\Version\V1\Controller\ApiAssetsController
{
    ...
}
```

The new Controller must be under the namespace Api\Version\Vn\Controller, where n is the version.

## **Define Versioned Components**
The steps to define a versioned Component are the following:

* Create a new BaseComponent file: app/Api/Version/Vn/Controller/Component/BaseNewComponent.php

```PHP
<?php

namespace Api\Version\Vn\Controller\Component;

class BaseNewComponent extends \Api\Version\Vx\Controller\Component\BaseNewComponent
{
  // put the Component code here, but only the new feature
  // modifications for this version
}
```

NOTE: In case that exists a previous version, the Base class should inherit from the previous version Base (x < n). If there is not a previous version, the Base class should inherit from \Component:

```PHP
<?php

namespace Api\Version\V1\Controller\Component;

class BaseNewComponent extends \Component
{
  // put the Component code here
}
```

* Create a new Component file: app/Api/Version/Vn/Controller/Component/NewComponent.php

```PHP
<?php

class NewComponent extends \Api\Version\Vx\Controller\Component\BaseNewComponent
{
    // empty
}
```

Note that the Component should inherit from the Base created in the previous step. And the body of this file should be empty, all the code should be in the Base.

The reason to put the code into the Base instead of into the Component is to allow new versions to inherit from previous version files. The Component has not a namespace (in order to follow CakePHP conventions), so every Component will have the same, no matter the version version. On the other hand, the Base has a namespace based on the version, so a new Base could explicitly inherit from an old one.

* Modify the original Component at the CakePHP path (app/Controller/Component/NewComponent.php)

```PHP
<?php

/**
 * Loads NewComponent Component according to the current code version (\Utils\Load\Version::getCurrentCodeVersion() )
 * The component code is at app/Api/Version/Vn/Controller/Component/NewComponent.php
 */
\Utils\Load\Version::loadComponent('NewComponent');
```

The purpose of the single line (above) is only the loading of the versioned Component. Yes, you can directly load the versioned Component, but we keep the file here at the CakePHP folder in order to not break the framework flow.

* Add an entry to app/Config/klient/default/default.json

```json
"versions": {
    "Controller": {
        ...
    },
    "Component": {
        ...,
        "NewComponent" : {
            "n" : "Vn"
        }
    },
    "Model": {
        ...
    }
}
```
Under the "Component" entry we added the version and the folder (app/Api/Version/n/...) where the new files are located.

## **Define Versioned Models**
The steps to define a versioned Model are the following:

* Create a new BaseExample file: app/Api/Version/Vn/Model/BaseExample.php

```PHP
<?php

namespace Api\Version\Vn\Model;

class ExampleHelper extends \Api\Version\Vx\Model\BaseExample
{
  // put the Model code here, but only the new features / modifications for this version
}
```

In case that exists a previous version, the Base class should inherit from the previous version Base (x < n). If there is not a previous version, the Base class should inherit from \AppModel:

```PHP
<?php

namespace Api\Version\V1\Model;

class BaseExample extends \AppModel
{
  // put the Model code here
}
```

* Create a new Model file: app/Api/Version/Vn/Model/Example.php

```PHP
<?php

class Example extends \Api\Version\Vx\Model\BaseExample
{
    // empty
}
```

Note that the Model should inherit from the Base created in the previous step. And the body of this file should be empty, all the code should be in the Base.

The reason to put the code into the Base instead of into the Model is to allow new versions to inherit from previous version files. The Model has not a namespace (in order to follow CakePHP conventions), so every Model will have the same name on different versions. On the other hand, the Base has a namespace based on the version, so a new Base could explicitly inherit from an old one.

* Modify the original Model at the CakePHP path (app/Model/Example.php)

```PHP
<?php

/**
 * Loads Example model according to the current code version (\Utils\Load\Version::getCurrentCodeVersion() )
 * The model code is at app/Api/Version/V.../Model/Example.php
 */
\Utils\Load\Version::loadModel('Example');
```

The purpose of the single line (above) is only the loading of the versioned Model. Yes, you can directly load the versioned Model, but we keep the file here at the CakePHP folder in order to not break the framework flow.

* Add an entry to app/Config/klient/default/default.json

```json
"versions": {
    "Controller": {
        ...
    },
    "Component": {
        ...
    },
    "Model": {
        ...,
        "Example" : {
            "n": "Vn"
        }
    }
}
```

Under the "Model" entry we added the version and the folder (app/Api/Version/n/...) where the new files are located.
