# Parity Report — ScreenCasting

Generated 2026-06-24T07:25:19.8565910+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=6  ·  6 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | 1 - Media Element Casting 101 | FAIL | 0/1 | — | 01_1_Media_Element_Casting_101.png | Scenario not reachable — no screenshot/UIA captured. |
| 2 | 2 - Casting APIs and a Custom Cast Button | FAIL | 0/1 | — | 02_2_Casting_APIs_and_a_Custom_Cast_Button.png | Scenario not reachable — no screenshot/UIA captured. |
| 3 | 3 - DIAL Sender Universal Windows app | FAIL | 0/3 | — | 03_3_DIAL_Sender_Universal_Windows_app.png | Scenario not reachable — no screenshot/UIA captured. |
| 4 | 4 - DIAL Receiver Windows Universal app | FAIL | 0/1 | — | 04_4_DIAL_Receiver_Windows_Universal_app.png | Scenario not reachable — no screenshot/UIA captured. |
| 5 | 5 - Multi-View Media Application | FAIL | 0/1 | — | 05_5_Multi_View_Media_Application.png | Scenario not reachable — no screenshot/UIA captured. |
| 6 | 6 - Combine Casting Methods | FAIL | 0/3 | — | 06_6_Combine_Casting_Methods.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 1 — 1 - Media Element Casting 101  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - MediaElement (player)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_1_Media_Element_Casting_101.png` against the baseline.

### Scenario 2 — 2 - Casting APIs and a Custom Cast Button  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - MediaElement (player)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_2_Casting_APIs_and_a_Custom_Cast_Button.png` against the baseline.

### Scenario 3 — 3 - DIAL Sender Universal Windows app  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - MediaElement (player)
  - TextBox "DIAL Application Name:"
  - TextBox "DIAL Launch Arguments:"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_3_DIAL_Sender_Universal_Windows_app.png` against the baseline.

### Scenario 4 — 4 - DIAL Receiver Windows Universal app  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - MediaElement (player)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/04_4_DIAL_Receiver_Windows_Universal_app.png` against the baseline.

### Scenario 5 — 5 - Multi-View Media Application  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - MediaElement (player)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/05_5_Multi_View_Media_Application.png` against the baseline.

### Scenario 6 — 6 - Combine Casting Methods  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - MediaElement (player)
  - TextBox "DIAL Application Name:"
  - TextBox "DIAL Launch Arguments:"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/06_6_Combine_Casting_Methods.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
