Software libraries used during the test cycles are defined within the Maven pom.xml file.  These libraries are located under the dependencies section of the pom.

Current libraries listed in the pom include:

Library | Function
-------| -------
selenium-java | handles the selenium test structures and execution
junit |  selenium test reporting and aggragation
mysql | adds functionality for connecting to, read from, and editing myself databases
selenium remote driver | allows for executes selenium tests remotely
imageio-core | used during the Asset Processor tests for reading image files types
imageio-tiff | sub-library from imageio specifically for TIFF file types
imageio-psd  |sub-library from imageio specifically for PSD file types
commons-csv |used for reading, creating and editing CSV files
rest-assured | Rest API framework library; allows for sending REST API calls and receiving their responses
json | JSON file support
json-schema-validator | sub-library of JSON; validates schema structures
mondo-java-driver | adds functionality for connecting to, reading from, and editing mongo databases
jedis |Java REDIS connector
log4j-core | extends the existing APACHE logging utility functions
 log4j-api |extends the existing APACHE logging utility functions
