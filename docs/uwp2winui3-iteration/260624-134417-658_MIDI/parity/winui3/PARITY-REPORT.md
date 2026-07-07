# Parity Report — MIDI

Generated 2026-07-07T12:03:49.2931540+08:00 by Compare-Parity.ps1.

**Parity score: 83.3 / 100**  ·  pass=2 partial=1 fail=0  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | MIDI Device Enumeration | PASS | 7/7 | 2/3 live | 01_MIDI_Device_Enumeration.png |  |
| 2 | Receive MIDI Messages | PASS | 2/2 | — | 02_Receive_MIDI_Messages.png |  |
| 3 | Send MIDI Messages | PARTIAL | 4/8 | 0/2 live | 03_Send_MIDI_Messages.png | Missing 4/8 control(s): ComboBox "Parameter 1"; ComboBox "Parameter 2"; ComboBox "Parameter 3"; TextBox (sysExMessageContent) |

## Scenarios needing work

### Scenario 3 — Send MIDI Messages  [PARTIAL]

- Missing 4/8 control(s): ComboBox "Parameter 1"; ComboBox "Parameter 2"; ComboBox "Parameter 3"; TextBox (sysExMessageContent)
- Controls not found in the WinUI 3 UIA tree:
  - ComboBox "Parameter 1"
  - ComboBox "Parameter 2"
  - ComboBox "Parameter 3"
  - TextBox (sysExMessageContent)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Send_MIDI_Messages.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
