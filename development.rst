****************************
GanttProject Developer Guide
****************************

This page provides instruction for building GanttProject 2.8 or
GanttProject HEAD from the source code.

The instructions assume that you're using Ubuntu-based Linux distribution.
The process on other disros and Windows/Mac OSX should be similar,
modulo differences in packages/paths and the way command line terminal works.

Prerequisites
-------------
A bare minimum which you need is:

1. `Java SE Development Kit <http://www.oracle.com/technetwork/java/javase/downloads/index.html>`_ (JDK)
version 8 from Oracle or `OpenJDK <http://openjdk.java.net>`_. You also need `JavaFX <http://docs.oracle.com/javase/8/javafx/get-started-tutorial/jfx-overview.htm>`_.
It is bundled with Oracle's JDK, but if you're using OpenJDK then you need to install JavaFX separately. It is
available as ``openjfx`` in Ubuntu repositories.

2. `Gradle <http://gradle.org>`_ or `ANT <http://ant.apache.org>`_ build tool. Gradle is recommended and will be the only
supported build tool in the next major versions, but in GanttProject 2.8 branch both Gradle and ANT can be used.

Please make sure that you can run ``java``, ``javac``, ``git`` and ``gradle`` commands.

Checking out the sources
-------------------------

The source code is stored in `GitHub repository <http://github.com/bardsoftware/ganttproject>`_.
You can clone the repository using::

    git clone https://github.com/bardsoftware/ganttproject.git

We also publish self-sufficient archives with the sources of the stable versions.
The latest published is `GanttProject 2.8.1 <https://github.com/bardsoftware/ganttproject/archive/ganttproject-2.8.1.zip>`_
Instructions below will be applicable to code extracted from source archives as well starting from GanttProject 2.8.2 (releases prior to GanttProject 2.8.2 do not contain gradle build files).

The rest of this page assumes that you checked out the sources using one of the ways into ``/tmp/ganttproject`` directory.

Branches
--------
GanttProject 2.8 code sits in a branch named ``BRANCH_2_8_X``.
Having cloned the repository, you can switch to that branch with ``git checkout BRANCH_2_8_X``.


Building with Gradle
--------------------

If everything is OK with your environment then the following will build
a binary distribution of GanttProject in ``ganttproject-builder/dist-bin`` directory::

    cd /tmp/ganttproject/ganttproject-builder
    gradle distBin

Now you can run GanttProject using ``ganttproject`` or ``ganttproject.bat`` script::

    cd dist-bin
    ./ganttproject


You can also start GanttProject using ``gradle runApp`` which will build a distro and launch
GanttProject as necessary.

Basically, that's everything that you need to be able to change the sources using any text editor, build and run the changed code.

Building and running from IDE
-----------------------------

The instructions below apply to `IntelliJ IDEA <https://www.jetbrains.com/idea/>`_,
but other popular IDEs can also be used in a similar way.


IDEA `supports Gradle <https://www.jetbrains.com/help/idea/2016.3/gradle.html>`_ out of the box.
You can just import GanttProject with ``File.New.Project from Existing Sources`` menu action in IDEA
where you need to choose ``ganttproject-builder/build.gradle`` file. When asked about the modules,
uncheck module ``..`` as shown on the screenshot below

.. image:: img/development/idea-gradle-import.png

Having completed import, you can run GanttProject using Gradle's runApp task. Open Gradle
pane in IDEA, find task ``runApp`` in ``ganttproject-builder/build.gradle`` file,
right-click and choose ``Run`` or ``Debug``.

.. image:: img/development/idea-run-ganttproject.png
