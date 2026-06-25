# Parity Report — Association Launching C# Sample

Generated 2026-06-25T22:33:06.7637439+08:00 by Compare-Parity.ps1.

**Parity score: 75 / 100**  ·  pass=3 partial=0 fail=1  ·  4 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Launching a file | PASS | 6/6 | 3/5 live | 01_Launching_a_file.png |  |
| 2 | Launching a URI | PASS | 5/6 | 2/4 live | 02_Launching_a_URI.png | Missing 1/6 control(s): TextBox "http://www.bing.com" |
| 3 | Receiving a file | FAIL | 0/3 | 0/3 live | 03_Receiving_a_file.png | Missing 3/3 control(s): Button "Create test file"; Button "Create test file with no file extension"; Button "Remove test files" |
| 4 | Receiving a URI | PASS | n/a | — | 04_Receiving_a_URI.png |  |

## Scenarios needing work

### Scenario 3 — Receiving a file  [FAIL]

- Missing 3/3 control(s): Button "Create test file"; Button "Create test file with no file extension"; Button "Remove test files"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Create test file"
  - Button "Create test file with no file extension"
  - Button "Remove test files"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Receiving_a_file.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
