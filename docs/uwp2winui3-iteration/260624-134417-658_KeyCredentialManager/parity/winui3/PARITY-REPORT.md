# Parity Report — KeyCredentialManager C# sample

Generated 2026-07-07T05:26:10.7357038+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=1  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Sign In Scenario | FAIL | 0/2 | 0/1 live | 01_Sign_In_Scenario.png | Missing 2/2 control(s): ListView (listView_UserTileList); Button "+" |

## Scenarios needing work

### Scenario 1 — Sign In Scenario  [FAIL]

- Missing 2/2 control(s): ListView (listView_UserTileList); Button "+"
- Controls not found in the WinUI 3 UIA tree:
  - ListView (listView_UserTileList)
  - Button "+"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Sign_In_Scenario.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
