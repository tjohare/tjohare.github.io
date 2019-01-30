A File Header shall be placed at the beginning of each source file. The file header should include the following

- File name
- Project or package definition
- Brief Description of purpose of file
- any dependancies or special instructions

For instance:
```sh
/***************
 * BaseSetup.java
 * package com.shinyshare;
 *
 * This is the base file from which all dependant libraries, configuration
 * utilities, and browser functions initiate from.   Testing configuration
 * variables are defined in the setup() method, as well as the browser
 * definitions and window sizing.   
 *
 * Special instructions:
 * The @After section tears down the driver if it is not NULL.
 * The following RULE must rename in place in order for testnames to be accessed.
 *      - @Rule public TestName testName = new TestName();
 ***************/
```
