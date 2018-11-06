Title: GanttProject Scheduler Explained

# GanttProject Scheduler

!!! note "TL;DR"
    This article explains various bits of task scheduling in GanttProject which may (or may not)
    affect task start dates.


Scheduling algorithm in GanttProject, referred hereafter as *the Scheduler*, takes decisions on task start
dates taking into account various constraints, with the ultimate goal to make
the duration of the whole project as short as possible. The Scheduler continuously runs after every change in
the project and updates task appropriately.

The Scheduler tries to be logical and unobtrusive, however it may move some tasks or may reject your updates
to the task schedule and it is important to understand its decisions.


## Simple unconstrained task

Simple task which is created by default with ``Task.New Task`` action is scheduled to the date
set by the user. Default date is the start of the timeframe which is currently shown on the chart.
You can change the start date using task table or task properties dialog and you can choose any date as
the start date, with the only exception that you can't schedule task on weekend or holiday.

## _Earliest begin_ constraint

Task which has non-empty constraint *Earliest begin* can't be started earlier than the date specified in the constraint
and will be scheduled as close to that date as possible. It may start later than that date if other constraints decide so. However
if there are no other constraints, the Scheduler will force the task to start at the specified *Earliest begin* date.

> **New in GanttProject 2.8**. Earliest begin constraint existed but was mostly ignored until [GanttProject 2.8 release](/releases).
> In GanttProject 2.8, however, it was fixed, and this change may affect older projects. 
> Please refer to the [release notes](/releases/#_scheduler_audit_and_report) to learn if your project is affected.


## Summary task

Task which groups one or more other tasks is called *Summary task* or *Supertask*. Provided that there are no other
constraints, the start date, end date and duration of a summary task are calculated from the dates of its child tasks.
The duration of a summary task is always the difference between the earliest start and latest end of its child tasks.

!!! note "New in GanttProject 2.8"
    Prior to GanttProject 2.8 scheduling properties of summary tasks were technically editable in the UI,
    despite that any edits would be immediately reverted by the Scheduler. In GanttProject 2.8 start/end dates and duration of summary
    tasks are not editable anymore.


## Dependency constraints

You can create links, or dependencies between tasks and the Scheduler will take them into account. The simplest and most frequently used
dependency is _Finish-Start_ dependency which says that successor task can't start earlier than predecessor task finishes. Successor task
may start a few days later, though, in some cases. Other constraints are: Finish-Finish, Start-Start and Start-Finish. In general constraint
written in the form ``<PredecessorDoesThis>-<SuccessorDoesThat>`` reads as
_in the absence of other constraints, date when SuccessorDoesThat minus date when PredecessorDoesThis = lag time_.

When Scheduler considers some task, it scans through all dependencies where that task plays the role of successor and chooses the earliest
start date which satisfies all dependency constraints.

### Lag time
The default value is 0, and can be changed to both positive and negative value, so that you
can have a task which starts one day before its predecessor ends.

### Hardness
Hardness is actually equality or inequality comparison in the formula above. Strong hardness is equivalent to ``=`` while rubber is equivalent to ``>=``.
In practice it means that for rubber dependencies lag between successor and predecessor is allowed grow bigger than specified lag value,
e.g. when predecessor moves backwards in time, successor will stay where it is, other constraints permitting.

## Summary task as successor

When summary task itself has a dependency and plays the role of successor, the Scheduler creates implicit dependencies of the same type and with the
same properties to all its child tasks. This may have consequences which look pretty natural when seen, but which are not exposed.
If we consider Finish-Start dependency where successor is a summary task then no child of that task can
start earlier than predecessor finishes, and any changes in the child task dates which violate this will be rejected. However, from user perspective it may
look as if GanttProject rejects moving task to earlier start date for no reason.
