A log file is a file that records either events that occur in an operating system or other software runs, or messages between different users of a communication software.  Logging is the act of keeping a log. In the simplest case, messages are written to a single log file or output to the system out console.

Logging is not required for QA Automation develop, but it is strongly encouraged.   To facilitate this, the logging capabilities have been extended in the Maven pom.xml through the addition of Log4j2 libraries.

Defining a default log class has been defined within the Basesetup.java file for automation but you may define your own log class as needed.
```sh
initialize: Log = LogManager.getLogger(this.testName.getMethodName());
invoke:     Log.info("RUNNING IN ENVIRONMENT: " + baseUrl );
```
