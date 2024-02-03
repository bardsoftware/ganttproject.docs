Title: Calculated Columns

# Calculated Columns

!!! note "Summary"
    Calculated columns were added in GanttProject 3.3.
    This article explains some non-trivial aspects of using calculated columns in GanttProject.

Calculated column is a task property, or a column in the task table, with the value that is calculated from 
the values of other columns. 

You can turn any task custom column into calculated using "Value is calculated" checkbox and "Value expression" field
in the column properties pane of the ``Column Manager`` dialog.

## Value expression

The value expression is an SQL expression which one would write in `SELECT` clause of a query against `Task` table 
with the following columns:


| name                  | type      | description                                                                               |
|-----------------------|-----------|-------------------------------------------------------------------------------------------|
| `uid`                 | `text`    | immutable long task identifier, unique across all projects unless a project is copied     | 
| `id`                  | `int`     | task number, visible as ID in the user interface, unique in the scope of a single project | 
| `name`                | `text`    | task name                                                                                 |
| `color`               | `text`    | RGB value of a task color in CSS format (e,g, `#ffca28`)                                  |
| `is_milestone`        | `boolean` | flag indicating if a task is a milestone or not                                           | 
| `is_project_task`     | `boolean` | flag indicating if a task is a "project task"                                             | 
| `start_date`          | `date`    | task start date                                                                           |
| `end_date`            | `date`    | task end date                                                                             |
| `duration`            | `int`     | task duration in days                                                                     |
| `completion`          | `int`     | task completion, percentage value in [0..100] interval                                    | 
| `earliest_start_date` | `date`    | task earliest start date, if any                                                          | 
| `priority`            | `text`    | task priority value, one of `{'0', '1', '2', '3', '4'}` **to be discussed**               |
| `web_link`            | `text`    | task web link value                                                                       |
| `cost_manual_value`   | `decimal` | task cost, if set explicitly, `null` otherwise                                            |
| `is_cost_calculated`  | `boolean` | flag indicating if task cost is calculated or set manually                                |
| `notes`               | `text`    | task notes                                                                                |
| `cost`                | `decimal` | task cost value, calculated or set explicitly                                             |

Value expressions are evaluated by the real SQL database engine. We use [H2 database](https://www.h2database.com), 
and you may use all standard SQL operations and [functions implemented in h2](https://www.h2database.com/html/functions.html).
Pay attention that equality operator in SQL is `=`, and string concatenation operator is `||`.

## Limitations

Calculated columns can be defined only for tasks and value expressions may use only the standard task properties described above.



