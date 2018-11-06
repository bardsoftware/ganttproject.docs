This page provides instruction for building GanttProject from the master branch.

The instructions assume that you're using Ubuntu-based Linux distribution.
The process on other distros and Windows/Mac OSX should be similar,
modulo differences in packages/paths and the way command line terminal works.

## Overview of the technologies and frameworks used in the build process

GanttProject build process uses Java, Kotlin and Google Protocol Buffers compilers. Orchestrating them
is not trivial, so be prepared to have some fun with setting up the things.

## Prerequisites

A bare minimum which you need is:

1. [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/index.html) (JDK)
version 8 from Oracle or http://openjdk.java.net[OpenJDK]. Later versions of JDK may or may not work for you. There
were major changes in JDK packaging, and we did not test the build process with the latest JDK.
2. [JavaFX  libraries](http://docs.oracle.com/javase/8/javafx/get-started-tutorial/jfx-overview.htm). JavaFX is
bundled with Oracle's JDK 8, but if you're using OpenJDK then you need to install JavaFX separately. It is
available as `openjfx` in Ubuntu repositories.
3. [Gradle](http://gradle.org) build tool for most of the development tasks.
If you're going to build DEB package or Mac OSX app you'll also need [ANT](http://ant.apache.org).
4. [Git](https://git-scm.com) version control to checkout the sources.

Please make sure that you can run ``java``, ``javac``, ``git`` and ``gradle`` commands.

## Checking out the sources

The source code is stored in [GitHub repository](http://github.com/bardsoftware/ganttproject).
You can clone the repository using

```
    git clone https://github.com/bardsoftware/ganttproject.git
```

We also publish self-sufficient archives with the sources of the stable versions.
The latest published is [GanttProject 2.8.9](https://github.com/bardsoftware/ganttproject/archive/ganttproject-2.8.9.zip)

The rest of this page assumes that you checked out the sources using one of the ways into `/tmp/ganttproject` directory.

## Branches

This document assumes that you work with `master` branch or with your own branch forked from `master`

## Downloading the required libraries

Before building you need to download some required libraries and frameworks. Run the following command to fetch them  from
Maven  repositories:

```
    cd /tmp/ganttproject/ganttproject-builder
    gradle updateLibs
```

## Building with Gradle

If everything is OK with your environment then the following will build
a binary distribution of GanttProject:

```
    cd /tmp/ganttproject/ganttproject-builder
    gradle updateLibs distBin
```

The distribution is assembled in  `ganttproject-builder/dist-bin` directory. You can
run GanttProject using `ganttproject` or `ganttproject.bat` script:

```
    cd /tmp/ganttproject/ganttproject-builder/dist-bin
    ./ganttproject
```

You can also start GanttProject using `gradle runApp` which will build a distro and launch
GanttProject as necessary.

Basically, that's everything that you need to be able to change the sources using any text editor,
 build and run the changed code.

## Building and running from IntelliJ IDEA


The instructions below apply to [IntelliJ IDEA](https://www.jetbrains.com/idea/)
but other popular IDEs can also be used in a similar way.


IDEA [supports Gradle](https://www.jetbrains.com/help/idea/2016.3/gradle.html) out of the box.
You can just import GanttProject with `File.New.Project from Existing Sources` menu action in IDEA
where you need to choose `ganttproject-builder/build.gradle` file. When asked about the modules,
uncheck module `..` as shown on the screenshot below

![Screenshot](/img/development/idea-gradle-import.png)

Having completed the import, you can run GanttProject using Gradle's runApp task. Open Gradle
pane in IDEA, find task `runApp` in `ganttproject-builder/build.gradle` file,
right-click and choose `Run` or `Debug`.

![Screenshot](/img/development/idea-run-ganttproject.png)


