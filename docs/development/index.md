## Building GanttProject

Build process is slightly different for stable GanttProject Pilsen and work-in-progress GanttProject Master. 

* How to [check out, compile and run GanttProject 2.8](./build-pilsen) using command line tools and IDEs.
* How to [check out, compile and run GanttProject Master](./build) using command line tools and IDEs.

## Base branch for pull requests

Short answer: send pull requests against `master`. Longer answer depends on the
change purpose. 

Bugfixes to some particular minor version shall be targeted to version branches. For GanttProject 2.8.11 
version branch is `BRANCH_2_8_X`. Bugfixes should be merged to the version branch first and to ``master`` afterwards.

New features normally shall be targeted to ``master`` branch.

## Change Process

In order to make a change and integrate it into GanttProject build you need to follow
the change process. In short, you need to make your own fork of our repository on GitHub,
create a branch forked from ``master`` (unless there is a good reason to choose some other branch),
hack, test, commit, push, create a pull request and pass
code review. Text below gives more details on these steps.

> **TL;DR**: Create branch per feature, follow the style, write tests, publish small pull requests early rather than later

### Fork the repository
First-time contributors will have to fork GanttProject repository into their own GitHub account.

### Create a branch
We use [feature branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows#feature-branch-workflow)
which is perfectly described at the link. If there is an appropriate ticket in
[GanttProject Issue Tracker](https://github.com/bardsoftware/ganttproject/issues)
 (it is a good idea to create one before you start hacking)
then your branch should be named like `tkt-<ISSUE_NUMBER>-<OPTIONAL_MNEMONIC>`
where ``<ISSUE_NUMBER>`` is the number of the issue and ``<OPTIONAL_MNEMONIC>`` is a
few words describing the purpose of the branch (handy when you run ``git branch`` or hit
Tab and get shell completions after typing ``git checkout``). Example name: ``tkt-1334-license``

### Hack
> The most important rule: publish early and keep changes small. See Code Review section below.

Hack, hack, hack. Please follow Java code style when hacking.
[Google Java Style Guide](https://google.github.io/styleguide/javaguide.html) is mostly ok,
with some important changes:

* Add copyright header and license notice in the new files (see below)
* Indent with spaces, not tabs
* Block indent is 2 spaces, line wrapping is 4 spaces
* K&R parentheses style
* member variables in classes should be prefixed with prefix ``my``. Static objects which are mutable per se should
be prefixed with ``our``. The purpose of prefix ``my`` is to be able to distinguish member and local variables
without IDE assistance. Please do not use ``this.`` prefix with ``my``. Please do not
use prefix ``my`` in the names of local variables and function arguments.

The following snippet follows our code style:


```java
public class Singleton {
  public static int DEFAULT_VALUE = 42;
  private static Singleton ourInstance;

  private int myValue;

  Singleton() {
    myValue = Singleton.DEFAULT_VALUE;
  }

  public void setValue(int value) {
    myValue = value;
  }

  public void getValueMultipliedByTheFirstArgumentAndAddedToTheSecond(
      int multiplier, int increment) {
    return myValue * multiplier + increment;
  }
}
```


### Testing

We write unit tests whenever it makes sense. Unfortunately by far not the whole
code base is covered. There is a module ``ganttproject-tester`` with
a few dozens of JUnit tests and useful test harness. You can run tests with ``gradle test``.

If your new code is not purely UI, it normally should come with tests.

### Commit, push, create pull request
We hope you know how to commit and push. Refer to [Atlassian tutorials](https://www.atlassian.com/git/tutorials/saving-changes)
 if you're absolutely new to Git. When you committed and pushed the changes,
[create a pull request in GitHub](https://help.github.com/articles/about-pull-requests/) against
the chosen base branch from ``bardsoftware/ganttproject`` repo.

### Code Review
Your code must be reviewed before it is merged into the main code base. The purpose
of code review is to make code better. Better code is more readable, is less error-prone
and is more test-friendly.

The smaller is your pull request, the easier and faster is the review. Pull requests
touching up to 200 lines are okay, up to 500 lines are acceptable. However, if the count
of lines affected by your change approaches 1000, it is a good reason to split pull request
into smaller pieces.

Don't hesitate to publish work which is not yet completed from user/product/feature perspective.
If your code makes sense and clearly will be used in future, follows the style and
is tested, it will be merged even if it is never called from other parts.

> Publish well-shaped small changes early rather than clunky big changes later.

Most likely you'll get a lot of comments and hopefully
you will find them reasonable and change the code appropriately. Be patient and respect the
fact that your code http://wiki.c2.com/?CodeForTheMaintainer[will be maintained by other people] and it is not you who will
be reading the code in the future.

> Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live. -- John F.Woods

Usually narrative comments (with optional word _Please_) say that reviewer thinks
that code must be changed. Interrogative comments, with optional _Maybe_ express
reviewer's opinion which you can argue if you have reasons to.


When the reviewer is satisfied with your code, you'll get approve and [LGTM](https://en.wiktionary.org/wiki/LGTM). After that
we'll merge your pull request into the main code base.

## Copyright and license

By contributing you agree with [contribution terms](./contribution). If you create
new files, please put the following snippet into the header:

```java
/*
Copyright 2020 YOUR_REAL_NAME_HERE, BarD Software s.r.o

This file is part of GanttProject, an opensource project management tool.

GanttProject is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

GanttProject is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GanttProject.  If not, see <http://www.gnu.org/licenses/>.
*/
```
