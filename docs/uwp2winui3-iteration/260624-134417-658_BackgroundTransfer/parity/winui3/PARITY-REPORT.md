# Parity Report — BackgroundTransfer

Generated 2026-06-27T09:50:37.1642892+08:00 by Compare-Parity.ps1.

**Parity score: 92.9 / 100**  ·  pass=6 partial=1 fail=0  ·  7 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | File Download | PASS | 8/8 | 3/5 live | 01_File_Download.png |  |
| 2 | File Upload | PASS | 5/5 | 2/3 live | 02_File_Upload.png |  |
| 3 | Completion Notifications | PASS | 4/4 | 0/2 live | 03_Completion_Notifications.png |  |
| 4 | Completion Groups | PASS | 2/2 | 0/1 live | 04_Completion_Groups.png |  |
| 5 | Random Access Downloads | PASS | 8/8 | 0/4 live | 05_Random_Access_Downloads.png |  |
| 6 | Recoverable Errors | PASS | 4/5 | 0/1 live | 06_Recoverable_Errors.png | Missing 1/5 control(s): TextBox "1234" |
| 7 | Download Reordering | PARTIAL | 3/4 | 0/2 live | 07_Download_Reordering.png | Missing 1/4 control(s): Button "Make Current" |

## Scenarios needing work

### Scenario 7 — Download Reordering  [PARTIAL]

- Missing 1/4 control(s): Button "Make Current"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Make Current"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/07_Download_Reordering.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
