## Categories
Test suites which contain a large number of individual tests can (and should) be additionally classified with a test category.   Test suites can be defined and executed from a profile definition.


**_Special Note: Automation tests can have multiple categories attached to them in the categories section. Automation tests that have multiple categories will only be run once when a
profile is invoked_**



Additional information from Apache detailing the use of categories can be found here: [http://maven.apache.org/surefire/maven-surefire-plugin/examples/junit.html](http://maven.apache.org/surefire/maven-surefire-plugin/examples/junit.html)

An example of how a category is defined within a test is provided:
```sh
@Test
@Category({Basic.class})
public void DownloadMultiAssetViewTiffsFromGlobal() throws Exception {
  ...
}
```

Within the POM, a profile can be specified as thus:
```sh
<profiles>
  	<profile>
  		<id>AllTestsWithoutCollections</id>
  		<build><plugins><plugin>
  					<groupId>org.apache.maven.plugins</groupId>
  					<artifactId>maven-surefire-plugin</artifactId>
  					<version>${maven-surefire-plugin.version}</version>
  					<configuration>
  						<groups>com.creativedrive.categories.Basic, com.creativedrive.categories.Search, com.creativedrive.categories.Bug</groups>
  					</configuration>
  		</plugin></plugins></build>
  	</profile>
</profiles>
```

Then tests specific to that profile can be invoked:
```
mvn clean test -PAllTestsWithoutCollections
```
NOTE: if a profile is invoked, all category classes defined within the 'configuration.groups' section will be invoked

## Criticality
It is important to label tests with how critical the issue is.   Test criticality is usually defined in the JIRA priority section of the corresponding bug or story ticket.

Priority levels are defined as (in order of hightest to lowest):

- HotFix
- Critical
- Major
- Minor
- Trivial
