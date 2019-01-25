In order to validate the user credentials the caller should include the token provided by the Authorization Service. For that purpose it should be passed as the Authorization header field. The API will check this field for each request

Additionally, the authorization formatting needs to one of 2 accepted structures:

1.  via Static Authorization token in the database, such as:
    * `Authorization=apitestkey`
1.  via user Bearer token, , such as:
    * `Authorization=Bearer eyJ0eXAiOiJCZWFyZXIiLCJhbGciOiJIUzUx...`


??? example "Here's an example of API request with the Authorization header highlighted:"
    ```json hl_lines="8"
    Request method:	PUT
    Request URI:	https://staging-my-api.creativedrive.com/v1/ui/2
    Proxy:			<none>
    Request params:	<none>
    Query params:	<none>
    Form params:	<none>
    Path params:	<none>
    Headers:		Authorization=Bearer eyJ0eXAiOiJCZWFyZXIiLCJhbGciOiJIUzUxMiIsImp0aSI6IjQxMzA3OGNkZTFkMTc0ZTAwMDNlYjkyYmUzNTAzM2Q2MjFhMDljNzMifQ.eyJqdGkiOiI0MTMwNzhjZGUxZDE3NGUwMDAzZWI5MmJlMzUwMzNkNjIxYTA5YzczIiwiaWF0IjoxNTQ3NzQ5NzU2LCJuYmYiOjE1NDc3NDk3NTYsImV4cCI6MTU0Nzc1MzM1NiwiaXNzIjoiYXBpLmNyZWF0aXZlZHJpdmUuY29tIiwiYXVkIjoiKi5jcmVhdGl2ZWRyaXZlLmNvbSIsImRhdGEiOnsidXNlcl9pZCI6MjUyLCJhY2NvdW50X2lkIjpudWxsLCJ1c2VybmFtZSI6bnVsbCwiZW1haWwiOiJzdG9yZXMuaW5zdGFuY2UuYWRtaW5AY3JlYXRpdmVkcml2ZS5jb20iLCJleHRlcm5hbF9pZCI6bnVsbH0sInNjb3BlcyI6eyJhaTkiOlsiQXV0aFNlcnZpY2UuKiJdLCJhaTMiOlsiQXV0aFNlcnZpY2UuKiJdfX0.57tsbYKHSjY4MIKhyAWHQcY-aNOQ_tXw-o32bVP1E1KcEZ2vFucxYtjzhaMwKy2aD1-k62Q3-4vq0Cu4liEM7w
    				Accept=*/*
    				Content-Type=application/json; charset=UTF-8
    Cookies:		<none>
    Multiparts:		<none>
    Body:
    {
        "data": {
            "auth_domain": "staging-my.creativedrive.com",
            "input_field_style": "color: #AAA; border-left: 2px solid #000 !important;",
            "page_title": "CreativeDrive | User Login",
            "sso_button_type": "text",
            "active": true,
            "background_value": "https://static.videezy.com/system/resources/previews/000/018/959/original/red.mp4",
            "sso_button_content": "Click to use your Single Sign-On Account ",
            "background_type": "video",
            "sso_enabled": true,
            "login_title": null,
            "logo": "https://www.creativedrive.com/wp-content/themes/creative_drive/img/logos/creativedrive.png",
            "login_btn_style": "color: #FFF; border-color:#FFF; background-color:#000",
            "logo_text": "CreativeDrive Logo"
        },
        "location": {
            "app_name": "Share",
            "instance_name": "Walmart"
        }
    }
    HTTP/1.1 202 Successfully updated resource
    ```

In the case in which the field is missing or the token is not valid, the HTTP response code will be 403 (Forbidden)




---

**NOTE**: Possibly, in the near future, this checking for all requests will change in favor of allow some actions without the need of an Authorization token.
