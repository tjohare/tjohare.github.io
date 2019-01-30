The QA team will develop both UI and RestAPI automation code using general software coding standards outlined herein for code written in any text based programming language such as, but not limited to, the Java software language.

The Project management tool to be used for QA Automation Code development will be a Maven Framework, and discussed in detail below.

## Tools
The following are a list of tools used during the development process for automation code.

- Maven
- IDE (Eclipse, IntelliJ, etc.)
- Jenkins
- _optional_: Homebrew


### Maven
#### Overview
Maven is a software project management and comprehension tool. Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.  Maven is part of the [Apache Maven Project](https://maven.apache.org/).

#### Objectives
Maven’s primary goal is to allow a developer to comprehend the complete state of a development effort in the shortest period of time. In order to attain this goal there are several areas of concern that Maven attempts to deal with:

- Making the build process easy
- Providing a uniform build system
- Providing quality project information
- Providing guidelines for best practices development
- Allowing transparent migration to new features

### IDE
An integrated development environment (IDE) is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of a source code editor, build automation tools, and a debugger. Most modern IDEs have intelligent code completion. Some IDEs, such as NetBeans and Eclipse, contain a compiler, interpreter, or both

### Jenkins
Jenkins is an open source automation server written in Java. Jenkins helps to automate the non-human part of the software development process, with continuous integration and facilitating technical aspects of continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat. It supports version control tools, including AccuRev, CVS, Subversion, Git, Mercurial, Perforce, ClearCase and RTC, and can execute Apache Ant, Apache Maven and sbt based projects as well as arbitrary shell scripts and Windows batch commands.

Builds can be triggered by various means, for example by commit in a version control system, by scheduling via a cron-like mechanism and by requesting a specific build URL. It can also be triggered after the other builds in the queue have completed. Jenkins functionality can be extended with plugins.

Since java is native to Jenkins, writing automation code in Java allows for a seemless integration for automated build deployments without the need for an additional compiler.

### Homebrew
Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's macOS operating system.
