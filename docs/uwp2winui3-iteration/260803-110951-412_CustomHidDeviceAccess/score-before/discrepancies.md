# Parity Discrepancies — CustomHidDeviceAccess (UWP → WinUI 3)

## Summary
The migrated WinUI 3 app has a **broken scenario navigation / content host**. The left
navigation list highlights the selected item correctly for all four scenarios, but the
content pane **never switches away from Scenario 1**. Scenarios 2, 3, and 4 render only
Scenario 1's content ("Connect to device" / "Disconnect from device" and the Scenario 1
description text), and their unique controls are entirely absent from the UIA tree.

This is confirmed three ways:
1. **Visual**: winui3 screenshots `02`, `03`, `04` show the nav highlight moved to the
   correct item, but the right pane still shows Scenario 1's "Connect to device" UI and
   the Scenario 1 description verbatim.
2. **UIA tree**: `parity/winui3/ui/02.json`–`04.json` contain only `ButtonConnectToDevice`
   / `ButtonDisconnectFromDevice` and the Scenario 1 description. None of the Scenario 2–4
   controls appear.
3. **Source**: the UWP scenario XAML defines distinct controls per scenario (see below),
   none of which exist in the migrated app.

The structural `Compare-Parity` gate reported PASS only because
`Extract-UwpFeatureChecklist` produced **0 controls per scenario** (checklist parse gap),
so coverage was "n/a" and every scenario defaulted to pass. That is a false pass; the
behavioral/visual evidence overrides it.

## Per-scenario

### 1. Connecting To Device — PASS
- Content renders correctly. `Connect to device` / `Disconnect from device` buttons,
  device list, and status region present and matching the UWP golden
  (`parity/baseline/screenshots/01_Connecting_To_Device.png`).

### 2. Feature Reports — FAIL (dead scenario)
- UWP source controls (missing in WinUI): `ButtonGetLedBlinkPattern` ("Get Led Blink
  Pattern"), `ButtonSetLedBlinkPattern` ("Set Led Blink Pattern"), `LedBlinkPatternInput`
  (ComboBox 0–7), error/status region.
- WinUI: none present; pane shows Scenario 1 content instead.

### 3. Input Report Events — FAIL (dead scenario)
- UWP source controls (missing in WinUI): `ButtonRegisterForInputReportEvents`
  ("Register For Event"), `ButtonUnregisterFromInputReportEvents` ("Unregister From
  Event"), input-report output region.
- WinUI: none present; pane shows Scenario 1 content instead.

### 4. Input and Output Reports — FAIL (dead scenario)
- UWP source controls (missing in WinUI): `ButtonSendNumericOutputReport` ("Send Output
  Report"), `NumericValueToWrite` (ComboBox 0–9), input/output report regions.
- WinUI: none present; pane shows Scenario 1 content instead.

## UWP golden capture note
The original UWP app launched successfully (Release, PID 17808, window
"Custom HID Device Access C# UAP") and Scenario 1 was captured live. Its legacy
CoreWindow does not expose its inner control tree through UIA to `winapp`, and synthetic
input to the composited CoreWindow did not register, so nav to UWP Scenarios 2–4 could not
be driven. Scenario 1 golden is a live capture; Scenarios 2–4 ground truth is taken from
source. This does not affect the verdict: the WinUI defect is that its own content host is
broken, proven by its own UIA tree and screenshots.
