# Parity Report — Bluetooth Rfcomm Chat Sample

Generated 2026-07-07T01:06:42.7769630+08:00 by Compare-Parity.ps1.

**Parity score: 66.7 / 100**  ·  pass=2 partial=0 fail=1  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Chat Client | FAIL | 3/8 | 2/5 live | 01_Chat_Client.png | Missing 5/8 control(s): Button "Request Access to Trusted Device"; Button "Disconnect"; TextBox (MessageTextBox); Button "Send"; ListBox (ConversationList) |
| 2 | Foreground Chat Server | PASS | 4/4 | 0/2 live | 02_Foreground_Chat_Server.png |  |
| 3 | Background Chat Server | PASS | 4/4 | 1/2 live | 03_Background_Chat_Server.png |  |

## Scenarios needing work

### Scenario 1 — Chat Client  [FAIL]

- Missing 5/8 control(s): Button "Request Access to Trusted Device"; Button "Disconnect"; TextBox (MessageTextBox); Button "Send"; ListBox (ConversationList)
- Controls not found in the WinUI 3 UIA tree:
  - Button "Request Access to Trusted Device"
  - Button "Disconnect"
  - TextBox (MessageTextBox)
  - Button "Send"
  - ListBox (ConversationList)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Chat_Client.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
