# Device Enumeration and Pairing C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Device Picker Common Control

- **Screenshot:** `screenshots/01_Device_Picker_Common_Control.png`
- **Page class:** `Scenario1_DevicePicker`
- **UI elements:**
  - ComboBox, name=selectorComboBox
  - Button, name=pickSingleDeviceButton
  - Button, name=showDevicePickerButton
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DevicePicker.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - pickSingleDeviceButton (Button)
  - showDevicePickerButton (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Enumerate and Watch Devices

- **Screenshot:** `screenshots/02_Enumerate_and_Watch_Devices.png`
- **Page class:** `Scenario2_DeviceWatcher`
- **UI elements:**
  - ComboBox, name=selectorComboBox, label="Choose a device selector:"
  - Button, name=startWatcherButton, label="Start Watcher"
  - Button, name=stopWatcherButton, label="Stop Watcher"
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_DeviceWatcher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Watcher "Start Watcher" (Button)
  - Stop Watcher "Stop Watcher" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Enumerate and Watch Devices in a Background Task

- **Screenshot:** `screenshots/03_Enumerate_and_Watch_Devices_in_a_Background_Task.png`
- **Page class:** `Scenario3_BackgroundDeviceWatcher`
- **UI elements:**
  - ComboBox, name=selectorComboBox
  - Button, name=startWatcherButton
  - Button, name=stopWatcherButton
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_BackgroundDeviceWatcher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - startWatcherButton (Button)
  - stopWatcherButton (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Enumerate Snapshot of Devices

- **Screenshot:** `screenshots/04_Enumerate_Snapshot_of_Devices.png`
- **Page class:** `Scenario4_Snapshot`
- **UI elements:**
  - ComboBox, name=selectorComboBox, label="Choose a device selector:"
  - Button, name=findButton, label="Find"
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_Snapshot.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Find "Find" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 5 - Get Single Device

- **Screenshot:** `screenshots/05_Get_Single_Device.png`
- **Page class:** `Scenario5_GetSingleDevice`
- **UI elements:**
  - TextBox, name=interfaceIdTextBox, label="Remembered device id:"
  - TextBox, name=InformationKindTextBox, label="Remembered device information kind:"
  - Button, name=getButton, label="Get"
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_GetSingleDevice.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get "Get" (Button)
- **Output elements:** interfaceIdTextBox, InformationKindTextBox, StatusBorder, StatusBlock

## Scenario 6 - Custom Filter with Additional Properties

- **Screenshot:** `screenshots/06_Custom_Filter_with_Additional_Properties.png`
- **Page class:** `Scenario6_CustomFilterAddedProps`
- **UI elements:**
  - TextBox, name=aqsFilterTextBox, label="System.Devices.InterfaceClassGuid:=&quot;{e6327cad-dcec-4949-ae8a-991e976a79d2}&quot; AND System.Devices.InterfaceEnabled:=System.StructuredQueryType.Boolean#True"
  - Button, name=startWatcherButton
  - Button, name=stopWatcherButton
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_CustomFilterAddedProps.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - startWatcherButton (Button)
  - stopWatcherButton (Button)
- **Output elements:** aqsFilterTextBox, StatusBorder, StatusBlock

## Scenario 7 - Request Specific DeviceInformationKind

- **Screenshot:** `screenshots/07_Request_Specific_DeviceInformationKind.png`
- **Page class:** `Scenario7_DeviceInformationKind`
- **UI elements:**
  - ComboBox, name=kindComboBox, label="Choose a DeviceInformationKind:"
  - Button, name=startWatcherButton, label="Start Watcher"
  - Button, name=stopWatcherButton, label="Stop Watcher"
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_DeviceInformationKind.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Watcher "Start Watcher" (Button)
  - Stop Watcher "Stop Watcher" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 8 - Basic Device Pairing

- **Screenshot:** `screenshots/08_Basic_Device_Pairing.png`
- **Page class:** `Scenario8_PairDevice`
- **UI elements:**
  - ComboBox, name=selectorComboBox
  - Button, name=startWatcherButton
  - Button, name=stopWatcherButton
  - Button, name=pairButton
  - Button, name=unpairButton
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario8_PairDevice.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - startWatcherButton (Button)
  - stopWatcherButton (Button)
  - pairButton (Button)
  - unpairButton (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 9 - Custom Device Pairing

- **Screenshot:** `screenshots/09_Custom_Device_Pairing.png`
- **Page class:** `Scenario9_CustomPairDevice`
- **UI elements:**
  - ComboBox, name=selectorComboBox, label="Choose a device selector:"
  - CheckBox, name=confirmOnlyOption, label="ConfirmOnly"
  - CheckBox, name=displayPinOption, label="DisplayPin"
  - CheckBox, name=providePinOption, label="ProvidePin"
  - CheckBox, name=confirmPinMatchOption, label="ConfirmPinMatch"
  - CheckBox, name=passwordCredentialOption, label="Credential"
  - ComboBox, name=protectionLevelComboBox, label="Choose a protection level:"
  - Button, name=startWatcherButton, label="Start Watcher"
  - Button, name=stopWatcherButton, label="Stop Watcher"
  - Button, name=pairButton, label="Pair Selected Device"
  - Button, name=unpairButton, label="Unpair Selected Device"
  - TextBox, name=pinEntryTextBox
  - Button, name=okButton
  - TextBox, name=usernameEntryTextBox
  - TextBox, name=passwordEntryTextBox
  - Button, name=verifyButton
  - Button, name=yesButton
  - Button, name=noButton
  - ListView, name=resultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario9_CustomPairDevice.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Watcher "Start Watcher" (Button)
  - Stop Watcher "Stop Watcher" (Button)
  - Pair Selected Device "Pair Selected Device" (Button)
  - Unpair Selected Device "Unpair Selected Device" (Button)
  - okButton (Button)
  - verifyButton (Button)
  - yesButton (Button)
  - noButton (Button)
- **Output elements:** pairingTextBlock, pinEntryTextBox, usernameEntryTextBox, passwordEntryTextBox, StatusBorder, StatusBlock

