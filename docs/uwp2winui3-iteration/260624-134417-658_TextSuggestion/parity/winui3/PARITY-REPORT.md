# Parity Report — TextSuggestion

Generated 2026-07-10T11:32:27.9005042+08:00 by Compare-Parity.ps1.

**Parity score: 50 / 100**  ·  pass=0 partial=3 fail=0  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Conversion | PARTIAL | 1/2 | 1/2 live | 01_Conversion.png | Missing 1/2 control(s): Button "Execute" |
| 2 | Prediction | PARTIAL | 1/2 | 1/2 live | 02_Prediction.png | Missing 1/2 control(s): Button "Execute" |
| 3 | ReverseConversion | PARTIAL | 1/2 | 1/2 live | 03_ReverseConversion.png | Missing 1/2 control(s): Button "Execute" |

## Scenarios needing work

### Scenario 1 — Conversion  [PARTIAL]

- Missing 1/2 control(s): Button "Execute"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Execute"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Conversion.png` against the baseline.

### Scenario 2 — Prediction  [PARTIAL]

- Missing 1/2 control(s): Button "Execute"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Execute"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Prediction.png` against the baseline.

### Scenario 3 — ReverseConversion  [PARTIAL]

- Missing 1/2 control(s): Button "Execute"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Execute"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_ReverseConversion.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
