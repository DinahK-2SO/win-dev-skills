# Parity Report — Pedometer

Generated 2026-07-08T12:28:30.0640105+08:00 by Compare-Parity.ps1.

**Parity score: 87.5 / 100**  ·  pass=3 partial=1 fail=0  ·  4 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Events | PASS | 1/1 | 1/1 live | 01_Events.png |  |
| 2 | History | PARTIAL | 4/8 | 2/3 live | 02_History.png | Missing 4/8 control(s): DatePicker (FromDate); TimePicker (FromTime); DatePicker (ToDate); TimePicker (ToTime) |
| 3 | Current step count | PASS | 1/1 | 1/1 live | 03_Current_step_count.png |  |
| 4 | Background Pedometer | PASS | n/a | — | 04_Background_Pedometer.png |  |

## Scenarios needing work

### Scenario 2 — History  [PARTIAL]

- Missing 4/8 control(s): DatePicker (FromDate); TimePicker (FromTime); DatePicker (ToDate); TimePicker (ToTime)
- Controls not found in the WinUI 3 UIA tree:
  - DatePicker (FromDate)
  - TimePicker (FromTime)
  - DatePicker (ToDate)
  - TimePicker (ToTime)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_History.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
