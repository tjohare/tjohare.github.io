Searching, sorting, filtering and pagination are simply the result of a query on one dataset. There should be no new set of APIs to handle these actions. To achieve this, we need to append the query params with the GET method API.

Let’s understand with few examples how to implement these actions.

## **Operation Types**

### Sorting
In case, the client wants to get the sorted list of companies, the GET /companies endpoint should accept multiple sort params in the query.

!!! example "`GET /companies?sort=rank_asc` would sort the companies by its rank in ascending order."

### Filtering
For filtering the dataset, we can pass various options through query params.

!!! example "`GET /companies?category=banking&location=india` would filter the companies list data with the company category of Banking and where the location is India"

### Searching
When searching the company name in companies list the API endpoint should be `GET /companies?search=Digital Mckinsey`

### Pagination
When the dataset is too large, we divide the data set into smaller chunks, which helps in improving the performance and is easier to handle the response. Eg. GET /companies?page=23 means get the list of companies on 23rd page.

## **Output and Meta sections**
All output shall be returned in JSON:API format

Whenever an endpoint allows for optional and complex parameters, you need to include a `meta` section in the JSON response of the API.  Meta section include items like:

* top
* limit
* offset
* total

If using this parameters, use ALL of these parameters, for consistency purposes.  

Here's an example of a proper `meta` section within a resonse below:

??? example "Sample Meta structure"
    ``` json
    {
    "meta": {
        "top": false,
        "limit": 25,
        "offset": 0,
        "total": 6608
    },
    "data": [
        {
          ...
        }
      ]
    }
    ```

!!! important
    Please note that if your API does NOT use optional and complex parameters it should NOT return a meta section.
