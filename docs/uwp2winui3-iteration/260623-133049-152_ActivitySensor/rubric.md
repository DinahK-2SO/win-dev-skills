# Feature Rubric — ActivitySensor (UWP → WinUI 3)

**Feature:** Activity sensor &nbsp;|&nbsp; **UWP launchable:** yes (window title `Activity Sensor C# Sample`, PID 11312, Release / .NET Native)

The original UWP app launched successfully (ground truth established; scenario-1 golden
captured at `parity/baseline/screenshots/01_Current_activity.png`). Per-scenario UWP
*actuation* could not be performed in this headless session — see `uwp_capture_status` in
`migration-score.json` — so per-feature expected behavior below is taken from the UWP
source handlers, which the migrated WinUI 3 app must replicate.

## Scenario 1 — Current activity
- **Controls:** `Get Current Activity` button.
- **Expected:** reads the default `ActivitySensor` current reading and populates the
  Activity / Confidence / Timestamp output fields (or a "no sensor" status when the
  hardware is absent).

## Scenario 2 — Activity history
- **Controls:** `Get Activity History` button.
- **Expected:** queries activity history over a time range; shows record count and
  per-record Activity / Confidence / Timestamp (or a status message).

## Scenario 3 — Events
- **Controls:** `ReadingChanged On`, `ReadingChanged Off`.
- **Expected:** `On` subscribes to `ReadingChanged` and live-updates the output;
  `Off` unsubscribes. **`Off` is disabled until `On` succeeds** (state-gated), and `On`
  only succeeds when an activity sensor is present.

## Scenario 4 — Background activity
- **Controls:** `Register Task`, `Unregister Task`.
- **Expected:** `Register Task` registers a background task for activity reports;
  `Unregister Task` removes it. **`Unregister Task` is disabled until a task is
  registered** (state-gated).
