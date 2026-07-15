# Parity Report — BackgroundTransfer

Generated 2026-07-15T11:01:22.6466306+00:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=7  ·  7 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | File Download | FAIL | 0/8 | 0/5 live | 01_File_Download.png | Scenario not reachable — no screenshot/UIA captured. |
| 2 | File Upload | FAIL | 0/5 | 0/3 live | 02_File_Upload.png | Scenario not reachable — no screenshot/UIA captured. |
| 3 | Completion Notifications | FAIL | 0/4 | 0/2 live | 03_Completion_Notifications.png | Scenario not reachable — no screenshot/UIA captured. |
| 4 | Completion Groups | FAIL | 0/2 | 0/1 live | 04_Completion_Groups.png | Scenario not reachable — no screenshot/UIA captured. |
| 5 | Random Access Downloads | FAIL | 0/8 | 0/4 live | 05_Random_Access_Downloads.png | Scenario not reachable — no screenshot/UIA captured. |
| 6 | Recoverable Errors | FAIL | 0/5 | 0/1 live | 06_Recoverable_Errors.png | Scenario not reachable — no screenshot/UIA captured. |
| 7 | Download Reordering | FAIL | 0/4 | 0/2 live | 07_Download_Reordering.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 1 — File Download  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/download.aspx"
  - TextBox "DownloadedFile.txt"
  - Button "Start Download"
  - Button "Start High Priority Download"
  - Button "Pause All"
  - Button "Resume All"
  - Button "Cancel All"
  - TextBox (outputField)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_File_Download.png` against the baseline.

### Scenario 2 — File Upload  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/Upload.aspx"
  - Button "Start Upload"
  - Button "Start Multipart Upload"
  - Button "Cancel All"
  - TextBox (outputField)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_File_Upload.png` against the baseline.

### Scenario 3 — Completion Notifications  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/notifications.aspx"
  - Button "Start three downloads and show toast on completion"
  - Button "Start three downloads and update tile on completion"
  - TextBox (outputField)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Completion_Notifications.png` against the baseline.

### Scenario 4 — Completion Groups  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/bitmap.aspx"
  - Button "Start ten downloads in a completion group"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/04_Completion_Groups.png` against the baseline.

### Scenario 5 — Random Access Downloads  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/randomAccess.aspx"
  - TextBox "RandomAccessFile.txt"
  - Button "Start"
  - Button "Pause"
  - Button "Resume"
  - Slider "Seek to position (MB)"
  - Button "Seek"
  - Slider "Current read position (MB)"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/05_Random_Access_Downloads.png` against the baseline.

### Scenario 6 — Recoverable Errors  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/recoverableErrors.aspx?shouldExpire=yes"
  - TextBox "RecoverableErrorsFile.txt"
  - CheckBox "Recover from expired URL"
  - Button "Start"
  - TextBox "1234"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/06_Recoverable_Errors.png` against the baseline.

### Scenario 7 — Download Reordering  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "http://localhost/BackgroundTransferSample/download.aspx"
  - TextBox "DownloadReordering.txt"
  - Button "Start Download"
  - Button "Make Current"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/07_Download_Reordering.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
