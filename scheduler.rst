GanttProject scheduling explained
=================================

.. highlights::

   This article explains various bits of task scheduling in GanttProject which may (or may not)
   affect the start date of any particular task.

Scheduling algorithm in GanttProject, referred hereafter as *the Scheduler*, takes decisions on when
any particular task will start taking into account various constraints, with the ultimate goal to make
the duration of the whole project as short as possible. The Scheduler tries to be logical and unobtrusive, however
it may move some tasks or may reject your updates to the task schedule and it is important to understand its decisions.


Simple unconstrained task
-------------------------

 Simple task which is created by default with ``Task.New Task`` action is scheduled to the date
 set by the user. Default date is the start of the timeframe which is currently shown on the chart.
 You can change the start date using task table or task properties dialog and you can choose any date as
 the start date, with the only exception that you can't schedule task on weekend or holiday.

.. _scheduler_earliest_begin:

Task with *Earliest begin* constraint
----------------------------------

Task which has non-empty constraint *Earliest begin* can't be started earlier than the date specified in the constraint
and will be scheduled as close to that date as possible. It may start later than that date if other constraints decide so. However
if there are no other constraints, the Scheduler will force the task to start at the specified *Earliest begin* date.

.. pull-quote::
   **New in GanttProject 2.8**. Earliest begin constraint existed but was mostly ignored until :ref:`release_2.8` release. In Pilsen,
   however, it was fixed, and this change may affect older projects. Please refer to :ref:`release_2.8_scheduler_report`
   to learn if your project is affected.

Summary task
------------

 Task which groups one or more other tasks is called *Summary task* or *Supertask*. Provided that there are no other
 constraints, the start date, end date and duration of a summary task are calculated from the dates of its child tasks.
 The duration of a summary task is always the difference between the earliest start and latest end of its child tasks.

.. pull-quote::
   **New in GanttProject 2.8**. Prior to GanttProject 2.8 scheduling properties of summary tasks were technically editable in the UI,
   despite that any edits would be immediately reverted by the Scheduler. In GanttProject 2.8 start/end dates and duration of summary
   tasks are not editable anymore.
