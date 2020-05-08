This page provides instruction for building GanttProject from the master branch.

The instructions assume that you're using Ubuntu-based Linux distribution.
The process on other distros and Windows/Mac OSX should be similar,
modulo differences in packages/paths and the way command line terminal works.

## Overview of the build technologies and frameworks

GanttProject build process uses Java, Kotlin and Google Protocol Buffers compilers. Orchestrating them
is not trivial, so be prepared to have some fun with setting up the things.

## Prerequisites

A bare minimum which you need is:

1. [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/index.html) (JDK)
version 11 from Oracle or [OpenJDK](http://openjdk.java.net). JDK builds from other vendors, such as Amazon or AdoptOpenJdk may also work fine.
2. [Git](https://git-scm.com) version control to checkout the sources.
3. Optionally you may install [Gradle](http://gradle.org) build tool. If you don't have Gradle, it will be downloaded automatically when running `gradlew` scripts.

Please make sure that you can run ``java``, ``javac`` and ``git`` commands.

## Checking out the sources

The source code is stored in [GitHub repository](http://github.com/bardsoftware/ganttproject).
You can clone the repository using

```
    git clone https://github.com/bardsoftware/ganttproject.git
```

The rest of this page assumes that you checked out the sources using one of the ways into `/tmp/ganttproject` directory.

## Branches

This document assumes that you work with `master` branch or with your own branch forked from `master`

## Submodules

This repository has some submodules that we need to pull:

```
    cd /tmp/ganttproject/
    git submodule update --init
```

## Building with Gradle

If everything is OK with your environment then the following will build
a binary distribution of GanttProject:

```
    cd /tmp/ganttproject/
    ./gradlew distbin
```

The distribution is assembled in  `ganttproject-builder/dist-bin` directory. You can
run GanttProject using `ganttproject` or `ganttproject.bat` script:

```
    cd /tmp/ganttproject/ganttproject-builder/dist-bin
    ./ganttproject
```

You can also start GanttProject using `./gradlew runApp` which will build a distro and launch
GanttProject as necessary.

If you don't need a ready-to-use distro, you can run `./gradlew build` which will build code and run tests.

Basically, that's everything that you need to be able to change the sources using any text editor,
 build and run the changed code.

## Building and running from IntelliJ IDEA


The instructions below apply to [IntelliJ IDEA](https://www.jetbrains.com/idea/)
but other popular IDEs can also be used in a similar way.


IDEA [supports Gradle](https://www.jetbrains.com/help/idea/2016.3/gradle.html) out of the box.
You can just import GanttProject with `File.New.Project from Existing Sources` menu action in IDEA
where you need to choose `build.gradle` file from the repository root. 

![Screenshot](/img/development/idea-gradle-import.png)

You may want to check `Use auto-import` and uncheck `Create separate module per source set` options. Make sure that you use Java 11. You may use local Gradle distro if you have one.

![Screenshot](/img/development/idea-gradle-import-settings.png)

Having completed the import, you can run GanttProject using Gradle's runApp task. Open Gradle
pane in IDEA, find task `runApp` in `ganttproject/build.gradle` file,
right-click and choose `Run` or `Debug`.

![Screenshot](/img/development/idea-run-ganttproject.png)


