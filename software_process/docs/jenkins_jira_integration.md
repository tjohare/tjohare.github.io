# How can we have Jenkins integrate with Jira
In order to reach our goal of Continuous Integration (CI), we need a way to automate the deployment process as well as the release documentation.  Ideally, the process should, in its most basic sense:

!!! link "What Do We Need to Do?"
    1. Deploy the Builds

    1. Update the Release tickets


To achieve this, there are several plugins that can be installed on the Jenkins server that will communicate with the JIRA application via REST API calls.  These are:

* `:::js JIRA` - This plugin integrates Jenkins to Atlassian JIRA.
* `:::js Jira Issue Updater` - This plugin can update Jira issues by changing their workflow status and adding comments.
* `:::js JiraTestResultReporter` - Plugin for creating JIRA issues directly from Jenkins and linking them to JUnit tests.

## Phase One
In phase one, utilizing the resources we listed above, we:

1. Start a Jenkins build job
1. Pass the information to JIRA to update the release ticket

!!! info "Demo Phase One process"


But this is not a complete CI process, as it does not take into account any Pre- (or Post-) deployment tickets, nor does it address a rapid deployment from Local to Dev to QA pipeline model.   

This leads us to ....

## Phase Two
To manage PRE deployment requirements, we need to do the required Pre-deployment task, and then have that automatically kick off the next required steps.   This can be accomplished with Webhooks in Jira[^1].

With Webhooks[^2], you can configure Jira to trigger a specific url on issue status change. The specific url should be a Jenkins API endpoint.  It's would look something similar to (if you are building with parameters):

[http://server/job/myjob/buildWithParameters?token=TOKEN&PARAMETER=Value](http://server/job/myjob/buildWithParameters?token=TOKEN&PARAMETER=Value)

Some more info on how to configure this in Jenkins: https://wiki.jenkins-ci.org/display/JENKINS/Remote+access+API

So this process would be something like:

1. Deployment team performs any PRE-deployment tasks and updates the Jira ticket, moving the task to 'DONE'
1. The status change in the Jira ticket fires the Jenkins build job automatically.
1. If the build completes successfully, Jenkins sends the API call to update the Jira deployment ticket to finished along with pertinent fix version and details.

## What Else Can We Do?
There are lots of opportunities for CI.  Here are a few examples:

* `:::js GIT polling` - Jenkins can ping GIT to see if there is a code change and automatically run build jobs
* `:::js SCM polling` - Jenkins can ping Jira and see if there is a particular field set and automatically run build jobs[^3]
* `:::js Complex Workflow Models` - ie. Dev -> Github -> Jenkins (build, deploy, & test) -> on Success, deploy to QA; on failure Create issue
* `:::js Automatic ticket updates` - Based on a JQL query, all tickets associated with that query can be both Transitioned and have comments added to them.

## DISCUSSION
*




[^1]: https://stackoverflow.com/questions/30080978/how-to-trigger-a-jenkins-job-from-a-status-change-in-jira
[^2]: https://developer.atlassian.com/jiradev/jira-architecture/webhooks
[^3]: https://community.atlassian.com/t5/Jira-questions/Start-jenkins-job-from-JIRA/qaq-p/72913
