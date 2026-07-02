# Parity Rubric — ActivitySensor (UWP → WinUI 3)

Feature: **Activity sensor** — 4 scenarios. Ground truth = original UWP C# sample
(launched live; PID 8092; window "Activity Sensor C# Sample").

| # | Scenario | Required controls | Action(s) to actuate | Output elements |
|---|----------|-------------------|----------------------|-----------------|
| 1 | Current activity | `ScenarioGetCurrentActivityButton` | Get Current Activity | Activity / Confidence / Timestamp |
| 2 | Activity history | `ScenarioGetActivityHistoryButton` | Get Activity History | Count + per-entry Activity/Confidence/Timestamp |
| 3 | Events | `ScenarioEnableReadingChangedButton`, `ScenarioDisableReadingChangedButton` | ReadingChanged On / Off | Activity / Confidence / ReadingTimestamp |
| 4 | Background activity | `ScenarioRegisterTaskButton`, `ScenarioUnregisterTaskButton` | Register Task / Unregister Task | TaskRegistration / TaskStatus / ReportCount / LastActivity |

Grading per scenario (folds structural coverage + behavioral response, then human
visual/behavioral judgment):
- **pass** — reachable, ≥80% baseline controls present, and (where a UWP behavioral
  baseline exists) no control that responds in UWP is dead in WinUI.
- **partial** — reachable, ≥40% coverage, or a confirmed dead-control regression.
- **fail** — unreachable / blank-and-broken / <40% coverage.

Score = round(100 × (pass + 0.5·partial) / 4).

## Environment caveats (recorded honestly)
- The bench host has **no interactive foreground desktop** (`GetForegroundWindow()==0`).
  Consequence 1: the live **UWP** app suspends in the background, so its UIA tree is
  empty and it cannot be driven/navigated — only its initial (Scenario 1) frame was
  captured. Consequence 2: the **WinUI 3** desktop app's DWM composition produces no
  pixels, so its screenshots are blank — but its UIA tree is fully populated (desktop
  apps aren't suspended), so structural + behavioral grading was done from UIA.
- The machine has **no activity-sensor hardware**: the live UWP app shows "No data" for
  every reading, so actions that depend on the sensor / background infrastructure are
  legitimately hardware-gated in both apps.
