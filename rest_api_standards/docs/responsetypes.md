## **JSON Schema Types**
At its core, JSON Schema defines the following basic types:

* String
* Numeric Types
* Boolean
* Null
* Objects
* Arrays

When defining how the REST API method returns the data, we need to make sure the correct data types are displayed in the response.    

## **Return Numeric values as Numbers, not Strings**
There is a large debate on whether number responses should be returned as STRINGS versus NUMBERS.  It's just a standard problem of PHP REST services.

For reference, there is an extremely good read on why numbers should be cast as strings found here: https://stackoverflow.com/questions/35709595/why-would-you-use-a-string-in-json-to-represent-a-decimal-number.  Essentially, unsigned integers and floating numbers are kept as strings to preserve precision.   

However, since we are not using decimal values, we should return values as INTEGERS as often as possible

??? success "Numeric values returned as a number type"
    ```json
    {
      "event_id":603
    }
    ```

??? bug "Numeric values returned as a String type"
    ```json
    {
      "event_id":"603"
    }
    ```

## **Use `true` and `false` values for Boolean representations**
In JSON, a common mistake is not using Booleans to represent true or false values. Don't use integers 1 or 0, or even worse, strings "1" or "0" to represent true or false.

The string "0" is interpreted as truthy in a lot of programming languages. If your API client uses it in a "if" statement, it might introduce a bug that’s hard to catch. A bug like this might even happen on the server, if this bad data comes back to it via a request body[^1].
[^1]: Filipe Ximenes and Flávio Juvenal. "How a RESTful API represents resources". January 4, 2018. https://www.oreilly.com/ideas/how-a-restful-api-represents-resources

??? success "Using true/false for Boolean values"
    ```json
    "active": true,
    ```

??? bug "Using 0/1 as TRUE/FALSE representations"
    ```json
    "is_system": "1"
    "allow_uploads": "1",
    "allow_create_subfolders": "0",
    ```

## **Use `null` in responses instead of a blank string**
Non existing numbers, strings, and booleans are usually represented as null. But string fields without value should also be represented as null, not "".  In its most basic terms, 'null' represents a non-value, whereas any other kind of thing represents some value.

!!! warning "Note: Empty arrays shall not be null. If a field is some kind of list and it is represented by an array, an array shall be returned, even if empty. This makes front-end developers’ work a lot easier."

!!! example "Example using null correctly"
    ```json
    {
        "id": 16784,
        "name": "Lorem Ipsum",
        "age": null,
        "relatives": [], // no relatives, null does not go in here
        "address": null
    }
    ```
