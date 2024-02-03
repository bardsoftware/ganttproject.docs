# What's new in GanttProject 3.3 
In this video we start a brief overview of the key features added in GanttProject 3.3

Imagine that you need to show a ticked check box against the completed tasks.
> show a check box column in the UI 

Or maybe show the task duration in hours, provided that there
are just 6 business hours per day? 
> show an integer column in the UI

You may create custom columns for such purposes, but keeping them  in sync 
with task completion or duration in days is surely troublesome. 

> Show mismatching completion and checkbox

GanttProject 3.3 makes it easier. You can create a custom column
that calculates its value for each task.

Let's create a calculated check box. It is a boolean column, and it will
appear ticked when this expression becomes true. 

> Show creation of a calculated column with "completion = 100" expression

Let's test it! This task is not yet completed, and the checkbox is blank.

> Show task with 50% completion

Now it is done, and the checkbox is ticked automatically.

> Change completion to 100%

What we can write in this expression field? It is basically an SQL expression which
is evaluated for each task row by the real SQL database engine. Please visit 
docs web site to learn more about the syntax and supported features.

