Title: Troubleshooting Microsoft Project files import

!!! note "Summary"
    This page describes possible reasons of task dates change after import from MS Project file.

While we do our best to import MS Project files as is, you may notice that after import some of the tasks change their dates. The reason is that Microsoft Project and GanttProject are different applications with different features and different behavior. If you see a warning saying that some of the tasks changed their dates, you may use the list below as a guide to fixing this issue. We recommend to start from the earliest task in the schedule because it might turn out to be the cause of changes in the whole subsequent chain.

So, why a task may change the dates after import:

1. In the original MS Project file it starts on weekend day and you import it into a project with non-working weekends. In this case you need to choose "replace existing calendar" option in the importer or import into project with working weekends
1. In the original MS Project file tasks have dependency with a lag. GanttProject by default makes the project as short as possible and when it can remove the lag, it will. In this case you need to set default dependency hardness to "Rubber" in the Gantt chart settings before you import a project.
1. In the original MS Project file tasks have duration less than 1 day and/or task starts on the same day when its predecessor ends. GanttProject's duration granularity is 1 day, and it assumes that task starts in the morning and finishes in the evening, so it is impossible for successor to start at the same day when predecessor finishes. You can set a negative lag in the dependency properties to fix it for the given pair of tasks, but GanttProject won't do it automatically during the import
1. Microsoft Project is known to be somewhat forgiving with respect to dependencies, and it is possible that task with e.g. Finish-Start dependency on its predecessor actually starts earlier than predecessor finishes in the original file. GanttProject is more strict and enforces the constraint.