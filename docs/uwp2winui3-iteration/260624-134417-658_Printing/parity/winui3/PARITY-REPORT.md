# Parity Report — Printing C# Sample

Generated 2026-07-09T04:54:17.1924872+08:00 by Compare-Parity.ps1.

**Parity score: 83.3 / 100**  ·  pass=5 partial=0 fail=1  ·  6 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Basic | PASS | 1/1 | 1/1 live | 01_Basic.png |  |
| 2 | Standard Options | PASS | n/a | — | 02_Standard_Options.png |  |
| 3 | Custom Options | PASS | 1/1 | 1/1 live | 03_Custom_Options.png |  |
| 4 | Page Range | PASS | 1/1 | 1/1 live | 04_Page_Range.png |  |
| 5 | Photos | PASS | 1/1 | 0/1 live | 05_Photos.png |  |
| 6 | Disable Preview | FAIL | 0/1 | 0/1 live | 06_Disable_Preview.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 6 — Disable Preview  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Print"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/06_Disable_Preview.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
