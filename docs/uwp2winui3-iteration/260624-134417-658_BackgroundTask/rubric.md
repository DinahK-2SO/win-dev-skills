# BackgroundTask — UWP feature rubric

Authoritative reference for scoring the migrated WinUI 3 app. Derived from the UWP
source (`...\Samples\BackgroundTask\cs` + sibling `shared\`) and a live launch of the
original UWP app (uwp-app-runner ok:true, pid 29060).

**UWP capture status:** _partial_ — the original UWP app launched and rendered
correctly, but only the initial shell frame (Scenario 1) could be captured. The
.NET Native UWP CoreWindow exposes an empty UIA tree and the session has no
interactive desktop, so scenarios 2–6 could not be individually navigated.

## Shell / Scenario navigation list

**ID:** `nav-scenario-list`
**Weight:** 2

Left-rail list of the 6 background-task scenarios; selecting an item shows that
scenario's content.

**Expected behaviour:**
- List shows exactly 6 items (1) Background Task … 6) Grouped Background Task)
- Selecting an item navigates the content pane to that scenario

**UWP reference screenshot:**
![nav-scenario-list](screenshots/01_Background_Task.png)

## Scenario 1 / Background Task (Time Zone Change)

**ID:** `scenario1-background-task`
**Weight:** 2

Registers a system-event background task for the Time Zone Change event.

**Expected behaviour:**
- Register/Unregister buttons present; Register enabled, Unregister disabled initially
- Status text reads "Unregistered" initially
- Clicking Register registers the task and updates Status; Unregister reverses it

**UWP reference screenshot:**
![scenario1-background-task](screenshots/01_Background_Task.png)

## Scenario 2 / Background Task with Condition

**ID:** `scenario2-background-task-with-condition`
**Weight:** 1

Registers a background task that runs only when a system condition is met.

**Expected behaviour:**
- Register/Unregister buttons present with the same toggle behaviour as Scenario 1
- Status/Progress output text present

**UWP reference screenshot:**
_UWP screenshot not captured (CoreWindow UIA empty + no interactive desktop; could not navigate to this scenario)._

## Scenario 3 / Servicing Complete Task

**ID:** `scenario3-servicing-complete-task`
**Weight:** 1

Registers a background task for the Servicing Complete event.

**Expected behaviour:**
- Register/Unregister buttons present
- Status/Progress output text present

**UWP reference screenshot:**
_UWP screenshot not captured (could not navigate to this scenario)._

## Scenario 4 / Background Task with Time Trigger

**ID:** `scenario4-time-triggered-task`
**Weight:** 1

Registers a background task that fires on a time trigger.

**Expected behaviour:**
- Register/Unregister buttons present
- Status/Progress output text present

**UWP reference screenshot:**
_UWP screenshot not captured (could not navigate to this scenario)._

## Scenario 5 / Background Task with Application Trigger

**ID:** `scenario5-application-trigger-task`
**Weight:** 2

Registers an application-trigger background task and can Signal it on demand.

**Expected behaviour:**
- Register, Unregister AND Signal buttons present (Signal distinguishes this scenario)
- Status/Progress/Result output text present

**UWP reference screenshot:**
_UWP screenshot not captured (could not navigate to this scenario)._

## Scenario 6 / Grouped Background Task

**ID:** `scenario6-grouped-background-task`
**Weight:** 2

Registers a grouped background task; supports unregistering grouped and ungrouped
tasks separately.

**Expected behaviour:**
- Register, Unregister and "Unregister Ungrouped Tasks" buttons present
- Status/Progress/Result output text present

**UWP reference screenshot:**
_UWP screenshot not captured (could not navigate to this scenario)._

RUBRIC COMPLETE: 7 features written to notes\rubric.json
