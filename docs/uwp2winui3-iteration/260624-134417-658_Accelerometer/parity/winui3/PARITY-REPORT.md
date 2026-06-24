# Parity Report — Accelerometer C# Sample

Generated 2026-06-24T14:50:23.7095208+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=6  ·  6 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Choose accelerometer | FAIL | 0/1 | — | 01_Choose_accelerometer.png | Scenario not reachable — no screenshot/UIA captured. |
| 2 | Data events | FAIL | 0/2 | — | 02_Data_events.png | Scenario not reachable — no screenshot/UIA captured. |
| 3 | Shake events | FAIL | 0/2 | — | 03_Shake_events.png | Scenario not reachable — no screenshot/UIA captured. |
| 4 | Polling | FAIL | 0/2 | — | 04_Polling.png | Scenario not reachable — no screenshot/UIA captured. |
| 5 | Orientation change | FAIL | 0/2 | — | 05_Orientation_change.png | Scenario not reachable — no screenshot/UIA captured. |
| 6 | Data events batching | FAIL | 0/2 | — | 06_Data_events_batching.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 1 — Choose accelerometer  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - ComboBox (ReadingTypeComboBox)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Choose_accelerometer.png` against the baseline.

### Scenario 2 — Data events  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Enable"
  - Button "Disable"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Data_events.png` against the baseline.

### Scenario 3 — Shake events  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Enable"
  - Button "Disable"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Shake_events.png` against the baseline.

### Scenario 4 — Polling  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Enable"
  - Button "Disable"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/04_Polling.png` against the baseline.

### Scenario 5 — Orientation change  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Enable"
  - Button "Disable"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/05_Orientation_change.png` against the baseline.

### Scenario 6 — Data events batching  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Enable"
  - Button "Disable"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/06_Data_events_batching.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
