Files used for QA automation are stored under project directories that correspond to their respective teams.

## Projects
The automation files used for the SHARE team are located under the 'shinyshare' project.  The files used for the TRACK team are located under the 'track' porject.   The files used for the VIEW team are located under the 'view' project.

## Project Suite files
Project suites are broken down by categories folders, page objects folders, utility functions, resource folders, and testsuite folders.   Files that are generated, such as the .class files, during the test cycle are placed with the target directory which is used as a test artifact directory as well in Jenkins.

### Category files
Category files are interface type java files that are very simple in design and invoked in individual tests in conjunction with running Maven Profiles.
```
package com.shinyshare.categories;

import org.junit.experimental.categories.Categories;
import org.junit.runner.RunWith;

@RunWith(Categories.class)
@Categories.IncludeCategory(Bug.class)
public interface Bug {

}
```

### Page Object files
A page object is a class that simply stores your page elements. Elements and methods are housed in the page object file. This pattern allows testers to write clean code, avoid duplication, and better maintain their suites.

### Utility Files
Utility files are files that perform a function that can be used with a testsuite, but are outside the scope of an individual page or project.   Functions, such as JSON file readers, random images generators, or movie creators are the type of files that are located within this directory.

### Resource Files
Resource files are files that affect suite configuration or invoke specific drivers for different test execution.   Examples of files found here are the log4j2.xml configuration file, and drivers for Linux, Windows, and Mac chromedriver executables.

### Testsuite Files
Testsuite files are further broken down by 'RestAPI' test suites and 'Smoke' test suites.   RestAPI files do not have a UI interface and test only backend and database functions.   Smoke files are UI-based test which test UI functions within the scope of the project team.   

For instance, SHARE UI-tests invoke and validate functions with the SHARE module, such as administrative functions, uploading files, and adding/editing metadata.

### Target files
The target directory is used to house all output of the build.  Files such as surefire reports, test class files, log4j files, screenshots, and generated-test-sources are located within these directory files.

Running the command `mvn clean` will destory all files within this directory.   
