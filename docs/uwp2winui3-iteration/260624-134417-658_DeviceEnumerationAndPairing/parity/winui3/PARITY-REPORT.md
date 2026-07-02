# Parity Report — Device Enumeration and Pairing C# Sample

Generated 2026-07-03T04:42:27.8249359+08:00 by Compare-Parity.ps1.

**Parity score: 88.9 / 100**  ·  pass=7 partial=2 fail=0  ·  9 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Device Picker Common Control | PASS | 4/4 | 1/2 live | 01_Device_Picker_Common_Control.png |  |
| 2 | Enumerate and Watch Devices | PARTIAL | 2/4 | 0/2 live | 02_Enumerate_and_Watch_Devices.png | Missing 2/4 control(s): Button "Start Watcher"; Button "Stop Watcher" |
| 3 | Enumerate and Watch Devices in a Background Task | PASS | 3/3 | 1/2 live | 03_Enumerate_and_Watch_Devices_in_a_Background_Task.png |  |
| 4 | Enumerate Snapshot of Devices | PASS | 3/3 | 1/1 live | 04_Enumerate_Snapshot_of_Devices.png |  |
| 5 | Get Single Device | PASS | 4/4 | 0/1 live | 05_Get_Single_Device.png |  |
| 6 | Custom Filter with Additional Properties | PASS | 4/4 | 2/2 live | 06_Custom_Filter_with_Additional_Properties.png |  |
| 7 | Request Specific DeviceInformationKind | PASS | 4/4 | 2/2 live | 07_Request_Specific_DeviceInformationKind.png |  |
| 8 | Basic Device Pairing | PASS | 6/6 | 2/4 live | 08_Basic_Device_Pairing.png |  |
| 9 | Custom Device Pairing | PARTIAL | 12/19 | 2/8 live | 09_Custom_Device_Pairing.png | Missing 7/19 control(s): TextBox (pinEntryTextBox); Button (okButton); TextBox (usernameEntryTextBox); TextBox (passwordEntryTextBox); Button (verifyButton); Button (yesButton); Button (noButton) |

## Scenarios needing work

### Scenario 2 — Enumerate and Watch Devices  [PARTIAL]

- Missing 2/4 control(s): Button "Start Watcher"; Button "Stop Watcher"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Start Watcher"
  - Button "Stop Watcher"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Enumerate_and_Watch_Devices.png` against the baseline.

### Scenario 9 — Custom Device Pairing  [PARTIAL]

- Missing 7/19 control(s): TextBox (pinEntryTextBox); Button (okButton); TextBox (usernameEntryTextBox); TextBox (passwordEntryTextBox); Button (verifyButton); Button (yesButton); Button (noButton)
- Controls not found in the WinUI 3 UIA tree:
  - TextBox (pinEntryTextBox)
  - Button (okButton)
  - TextBox (usernameEntryTextBox)
  - TextBox (passwordEntryTextBox)
  - Button (verifyButton)
  - Button (yesButton)
  - Button (noButton)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/09_Custom_Device_Pairing.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
