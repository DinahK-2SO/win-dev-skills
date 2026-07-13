# UWP Feature Rubric — ActivitySensor

**UWP capture status:** partial. `uwp-app-runner` returned `ok:true` (process alive, window
"Activity Sensor C# Sample" present), but the app **hung on its extended splash screen**
("Windows platform sample") and never presented its main page. The UIA content Pane was
empty and the process reported `Responding:False` across two launches, a 15s settle,
aggressive foregrounding, and 60s+ waits. Only the splash frame could be captured; no
functional golden baseline exists.

## Scenario 1 / Current activity

**ID:** `current-activity`
**Weight:** 1

Clicking "Get Current Activity" queries the ActivitySensor and displays the current
activity, confidence, and timestamp.

**Expected behaviour:**
- A "Get Current Activity" button is visible
- Clicking it populates activity/confidence/timestamp output text blocks
- A status message updates in the shared status bar

**UWP reference screenshot:**
_UWP screenshot not captured (app hung on extended splash; main UI never rendered)._

## Scenario 2 / Activity history

**ID:** `activity-history`
**Weight:** 1

Clicking "Get Activity History" reads the activity history and lists count plus history
entries with confidence and timestamps.

**Expected behaviour:**
- A "Get Activity History" button is visible
- Clicking it populates a count and history entries
- A status message updates in the shared status bar

**UWP reference screenshot:**
_UWP screenshot not captured (app hung on extended splash; main UI never rendered)._

## Scenario 3 / Events

**ID:** `events`
**Weight:** 1

"ReadingChanged On"/"ReadingChanged Off" subscribe/unsubscribe to the ReadingChanged event
and stream live activity/confidence/timestamp output.

**Expected behaviour:**
- "ReadingChanged On" and "ReadingChanged Off" buttons are visible
- Enabling updates activity/confidence/timestamp as readings arrive
- Disabling stops updates; status bar reflects state

**UWP reference screenshot:**
_UWP screenshot not captured (app hung on extended splash; main UI never rendered)._

## Scenario 4 / Background activity

**ID:** `background-activity`
**Weight:** 1

"Register Task"/"Unregister Task" register or remove a background task and show task
registration/status, report count, and last reported activity.

**Expected behaviour:**
- "Register Task" and "Unregister Task" buttons are visible
- Registering shows task registration/status output
- Unregistering clears it; status bar reflects state

**UWP reference screenshot:**
_UWP screenshot not captured (app hung on extended splash; main UI never rendered)._
