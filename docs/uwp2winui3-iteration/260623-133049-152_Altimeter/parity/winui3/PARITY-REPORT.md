# Parity Report — Altimeter

Generated 2026-06-24T09:03:05.5527105+08:00 by Compare-Parity.ps1.

**Parity score: 50 / 100**  ·  pass=1 partial=0 fail=1  ·  2 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Data Events | PASS | 2/2 | 0/2 live | 01_Data_Events.png |  |
| 2 | Polling | FAIL | 0/1 | 0/1 live | 02_Polling.png | Missing 1/1 control(s): Button "Get Data" |

## Scenarios needing work

### Scenario 2 — Polling  [FAIL]

- Missing 1/1 control(s): Button "Get Data"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Get Data"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Polling.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
