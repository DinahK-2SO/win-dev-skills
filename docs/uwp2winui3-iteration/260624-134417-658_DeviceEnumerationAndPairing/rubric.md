# Parity Rubric — Device Enumeration and Pairing (C#)

Scenario X: `DeviceEnumerationAndPairing`
Ground-truth source: `uwp-samples-standalone/Samples/DeviceEnumerationAndPairing/cs`
Feature checklist: `parity/baseline/checklist.json` (9 scenarios).

A scenario scores **pass** when the migrated WinUI 3 page (a) is reachable, (b) contains
the equivalent of every checklist control (visible controls in the UIA tree, plus
by-design collapsed/dynamic controls verified in wired markup), and (c) its exercisable
action controls produce the same visible effect as the UWP original. **partial** when
recognizable but a real control is missing or a live control is dead vs UWP. **fail** when
the scenario is unreachable, blank, or largely absent.

| # | Scenario | Controls (checklist) | Key actions to actuate | Expected output |
|---|----------|----------------------|------------------------|-----------------|
| 1 | Device Picker Common Control | selectorComboBox, pickSingleDeviceButton, showDevicePickerButton, resultsListView | Pick Single Device; Show Device Picker | Status text / picker |
| 2 | Enumerate and Watch Devices | selectorComboBox, startWatcherButton, stopWatcherButton, resultsListView | Start Watcher; Stop Watcher | "N devices found… Watching for updates…" |
| 3 | Enumerate and Watch Devices in a Background Task | selectorComboBox, startWatcherButton, stopWatcherButton | Start/Stop Watcher | Status text |
| 4 | Enumerate Snapshot of Devices | selectorComboBox, findButton, resultsListView | Find | Device list populated |
| 5 | Get Single Device | interfaceIdTextBox, InformationKindTextBox, getButton, resultsListView | Get | Device info text |
| 6 | Custom Filter with Additional Properties | aqsFilterTextBox, startWatcherButton, stopWatcherButton, resultsListView | Start/Stop Watcher | Status text |
| 7 | Request Specific DeviceInformationKind | kindComboBox, startWatcherButton, stopWatcherButton, resultsListView | Start/Stop Watcher | Status text |
| 8 | Basic Device Pairing | selectorComboBox, startWatcherButton, stopWatcherButton, pairButton, unpairButton, resultsListView | Start/Stop Watcher; Pair/Unpair | Status text (pair gated by selection) |
| 9 | Custom Device Pairing | selector + 5 pairing-kind checkboxes, protectionLevelComboBox, start/stop/pair/unpair buttons, + dynamic ceremony controls (pinEntryTextBox, okButton, username/passwordEntryTextBox, verifyButton, yesButton, noButton), resultsListView | Start/Stop Watcher; Pair; ceremony buttons | Status text; ceremony UI shown on demand |

Notes:
- Scenario 9's ceremony controls (PIN/password/confirm) are `Visibility="Collapsed"` by
  default in **both** the UWP original and the WinUI migration; they surface only during a
  live pairing ceremony. Absence from the static visible tree is by design, not a defect.
