# Rubric — ActivitySensor (Feature: Activity sensor)

Ground truth derived from the UWP source and the live UWP golden capture. Grading:
`score = round(100 * (pass + 0.5*partial) / total)`. A control present-but-dead
(responds in UWP, dead in WinUI) is at most **partial**; a genuinely blank scenario
(`anyFrameRendered=false`) is **fail**.

## Scenario 1 — Current activity
- Controls: **Get Current Activity** (Button)
- Actions: Get Current Activity
- Outputs: Activity, Confidence, Timestamp, Status
- Pass: reachable; button present and responds (updates output/status) as in UWP.

## Scenario 2 — Activity history
- Controls: **Get Activity History** (Button)
- Actions: Get Activity History
- Outputs: Count, First/Last Activity·Confidence·Timestamp, Status
- Pass: reachable; button present and responds as in UWP.

## Scenario 3 — Events
- Controls: **ReadingChanged On**, **ReadingChanged Off** (Buttons)
- Actions: ReadingChanged On, ReadingChanged Off
- Outputs: Activity, Confidence, Reading Timestamp, Status
- Pass: both present; "On" responds; "Off" state matches UWP (disabled/inert until subscribed).

## Scenario 4 — Background activity
- Controls: **Register Task**, **Unregister Task** (Buttons)
- Actions: Register Task, Unregister Task
- Outputs: Task Registration, Task Status, Report Count, Last Activity·Confidence·Timestamp, Status
- Pass: both present; **Register Task must respond** (update status) as in UWP; "Unregister Task" state matches UWP (disabled until registered).
