## General Rules
- Functions that can fail (i.e. file I/O) should always return a success or error as a return code parameter.
- Any time a subroutine calls a function that returns an error condition, the error condition should be captured in a log (at a minimum) to the system console and to the log4j2 log file as well.
- Error recovery should be handled in the routine that is responsible for the domain in which the error occurs (e.g. A file error should not be passed up from file_IO( ) to Main for handling).
- The WebUtil file (package com.creativedrive.util.WebUtil) contains a 'takeAScreenshot' method that can be used during UI tests (example below:).  This can be invoked during a verification routine or from a try-catch routine on failure.
```
example.ui.takeascreenshot:

public static void takeAScreenshot(String name, WebDriver driver) throws Exception {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime date = LocalDateTime.now();
    String formattedDateTime = date.format(formatter);

    File scrFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
    FileUtils.copyFile(scrFile, new File(screenshots + "/" + name + "_" + formattedDateTime + ".png"));
}
```
- RestAPI test setup should have logging capabilities (ie. 'log().all()' ) turned on in both the request specification and the request response Specifications 
```
example.restapi.logging:

response =  
  RestAssured.given().
    header("Content-Type", "application/json").
    header("Authorization", bearerToken).
    pathParam("defaultLocation", defaultLocation).
    log().all().
  when().
    get("/locations/{defaultLocation}").
  then().
    log().all().
    statusCode(200).
    contentType("application/vnd.api+json").
  extract().response();
```
