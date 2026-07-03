# Parity Report — Geolocation

Generated 2026-07-04T02:34:15.4637261+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=8  ·  8 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Track position | FAIL | 0/2 | — | 01_Track_position.png | Scenario not reachable — no screenshot/UIA captured. |
| 2 | Get position | FAIL | 0/3 | — | 02_Get_position.png | Scenario not reachable — no screenshot/UIA captured. |
| 3 | Background position | FAIL | 0/2 | — | 03_Background_position.png | Scenario not reachable — no screenshot/UIA captured. |
| 4 | Foreground geofencing | FAIL | 0/15 | — | 04_Foreground_geofencing.png | Scenario not reachable — no screenshot/UIA captured. |
| 5 | Background geofencing | FAIL | 0/2 | — | 05_Background_geofencing.png | Scenario not reachable — no screenshot/UIA captured. |
| 6 | Get last visit | FAIL | 0/1 | — | 06_Get_last_visit.png | Scenario not reachable — no screenshot/UIA captured. |
| 7 | Foreground visit monitoring | FAIL | 0/2 | — | 07_Foreground_visit_monitoring.png | Scenario not reachable — no screenshot/UIA captured. |
| 8 | Background visit monitoring | FAIL | 0/2 | — | 08_Background_visit_monitoring.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 1 — Track position  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Start Tracking"
  - Button "Stop Tracking"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Track_position.png` against the baseline.

### Scenario 2 — Get position  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "0"
  - Button "Get Geolocation"
  - Button "Cancel"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Get_position.png` against the baseline.

### Scenario 3 — Background position  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Register"
  - Button "Unregister"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Background_position.png` against the baseline.

### Scenario 4 — Foreground geofencing  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "(Required)"
  - Button "Set to Here"
  - TextBox "(Required)"
  - TextBox "(Required)"
  - TextBox "(Required)"
  - TextBox (DwellTime)
  - RadioButton (StartImmediately)
  - RadioButton (StartAtSpecificTime)
  - DatePicker (StartDate)
  - TimePicker (StartTime)
  - CheckBox "Single Use"
  - Button "Create Geofence"
  - ListBox (RegisteredGeofenceListBox)
  - Button "Remove Geofence"
  - ListBox (GeofenceEventsListBox)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/04_Foreground_geofencing.png` against the baseline.

### Scenario 5 — Background geofencing  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Register"
  - Button "Unregister"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/05_Background_geofencing.png` against the baseline.

### Scenario 6 — Get last visit  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Get last Visit"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/06_Get_last_visit.png` against the baseline.

### Scenario 7 — Foreground visit monitoring  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Start Monitoring"
  - Button "Stop Monitoring"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/07_Foreground_visit_monitoring.png` against the baseline.

### Scenario 8 — Background visit monitoring  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Register"
  - Button "Unregister"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/08_Background_visit_monitoring.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
