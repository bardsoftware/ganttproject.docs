## Release numbering
GanttProject release numbering tries to follow [Semantic Versioning](https://semver.org/) scheme.
The release number consists of three parts and looks like `EPIC.FEATURE.MAINTENANCE`.

### Maintenance updates
We increment `MAINTENANCE` number when we publish a new version with bugfixes which do not break
file compatibility. Files produced by version ``2.8.N`` should be absolutely compatible
with files produced by any version ``2.8.K`` for any ``K<>N``. As a rule of thumb, the decision
to upgrade to newer bugfix release should be a no-brainer for the user because it can only
make his experience better. Also bugfix release normally requires no changes in the translations.

Maintenance updates cadence is measured by weeks or a few months.

### Feature updates
We usually increment `FEATURE` number when we add new features which may break file compatibility
or require translation efforts. Normally
we maintain file-wise compatibility with the previous versions and aim at partial backward
compatibility. That is, version ``2.8`` should be able to read files produced by version ``2.7``
, and version ``2.6`` should be able to read files
produced by version ``2.8``, perhaps with restricted functionality and
with a chance to lose some data if the file gets overwritten, but without failures.

Every feature update starts a new series of maintenance updates which all share the same mnemonic name.
Feature updates cadence is usually measured by months. Sometimes it takes a few years to get to the next
feature update though.

### Epic updates
When we add a really big feature or completely re-write something, we update the `EPIC` number.
This may happen when we introduce incompatible changes to file format, or significantly update the user interface
or do something else which greatly distinguishes the new version from all the previous ones. 

Epic updates are very rare.

## Release history

The list of the latest feature updates and corresponding release series in the reverse chronological order.

Date           | Release
:------------- | :------------------------------------
26 July 2016   | [GanttProject 2.8 "Pilsen"](/releases/pilsen)
22 January 2015 | [GanttProject 2.7 "Ostrava"](/releases/ostrava)
23 November 2012 | [GanttProject 2.7 "Brno"](http://ganttproject.blogspot.com/search/label/Brno)
11 March 2012 | [GanttProject 2.5 "Praha"](http://ganttproject.blogspot.com/search/label/Praha)
