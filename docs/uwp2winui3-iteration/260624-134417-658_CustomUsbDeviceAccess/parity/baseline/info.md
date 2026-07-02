# Custom USB Device Access — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Connect/Disconnect

- **Screenshot:** `screenshots/01_Connect_Disconnect.png`
- **Page class:** `Scenario1_ConnectDisconnect`
- **UI elements:**
  - Button, name=ButtonConnectToDevice, label="Connect to device", events=Click
  - Button, name=ButtonDisconnectFromDevice, label="Disconnect from device", events=Click
  - ListBox, name=ConnectDevices
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_ConnectDisconnect.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Connect to device "Connect to device" (Button)
  - Disconnect from device "Disconnect from device" (Button)
- **Output elements:** InputTextBlock1, StatusBlock, StatusBorder

## Scenario 2 - Control Transfer

- **Screenshot:** `screenshots/02_Control_Transfer.png`
- **Page class:** `Scenario2_ControlTransfer`
- **UI elements:**
  - ComboBox, name=OsrFx2SevenSegmentSettingInput
  - Button, name=ButtonGetOsrFx2SevenSegment, label="Get Seven Segment Display", events=Click
  - Button, name=ButtonSetOsrFx2SevenSegment, label="Set Seven Segment Display", events=Click
  - ComboBox, name=SuperMuttLedBlinkPatternInput
  - Button, name=ButtonGetSuperMuttLedBlinkPattern, label="Get Led Blink Pattern", events=Click
  - Button, name=ButtonSetSuperMuttLedBlinkPattern, label="Set Led Blink Pattern", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ControlTransfer.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Seven Segment Display "Get Seven Segment Display" (Button)
  - Set Seven Segment Display "Set Seven Segment Display" (Button)
  - Get Led Blink Pattern "Get Led Blink Pattern" (Button)
  - Set Led Blink Pattern "Set Led Blink Pattern" (Button)
- **Output elements:** OsrFx2ScenarioText, SuperMuttScenarioText, StatusBlock, StatusBorder

## Scenario 3 - Interrupt Pipes

- **Screenshot:** `screenshots/03_Interrupt_Pipes.png`
- **Page class:** `Scenario3_InterruptPipes`
- **UI elements:**
  - Button, name=ButtonRegisterOsrFx2InterruptEvent, label="Register For Interrupt Event", events=Click
  - Button, name=ButtonWriteSuperMuttInterruptOut, label="Write To Interrupt Out", events=Click
  - Button, name=ButtonRegisterSuperMuttInterruptEvent, label="Register For Interrupt Event", events=Click
  - Button, name=ButtonUnregisterInterruptEvent, label="Unregister From Interrupt Event", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_InterruptPipes.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register For Interrupt Event "Register For Interrupt Event" (Button)
  - Write To Interrupt Out "Write To Interrupt Out" (Button)
  - Register For Interrupt Event "Register For Interrupt Event" (Button)
  - Unregister From Interrupt Event "Unregister From Interrupt Event" (Button)
- **Output elements:** OsrFx2ScenarioText, SuperMuttScenarioText, SwitchStates, StatusBlock, StatusBorder

## Scenario 4 - Bulk Pipes

- **Screenshot:** `screenshots/04_Bulk_Pipes.png`
- **Page class:** `Scenario4_BulkPipes`
- **UI elements:**
  - Button, name=ButtonBulkRead, label="Read 512 bytes", events=Click
  - Button, name=ButtonBulkWrite, label="Write 512 bytes", events=Click
  - Button, name=ButtonBulkReadWrite, label="Continuously Read and Write 512 bytes", events=Click
  - Button, name=ButtonCancelAllIoTasks, label="Cancel all Read/Write tasks", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_BulkPipes.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Read 512 bytes "Read 512 bytes" (Button)
  - Write 512 bytes "Write 512 bytes" (Button)
  - Continuously Read and Write 512 bytes "Continuously Read and Write 512 bytes" (Button)
  - Cancel all Read/Write tasks "Cancel all Read/Write tasks" (Button)
- **Output elements:** GeneralScenarioText, StatusBlock, StatusBorder

## Scenario 5 - USB Descriptors

- **Screenshot:** `screenshots/05_USB_Descriptors.png`
- **Page class:** `Scenario5_UsbDescriptors`
- **UI elements:**
  - ListBox, name=ListOfDescriptorTypes, events=SelectionChanged
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_UsbDescriptors.xaml.cs`)_
- **Output elements:** GenericScenarioText, DescriptorOutput, StatusBlock, StatusBorder

## Scenario 6 - Interface Settings

- **Screenshot:** `screenshots/06_Interface_Settings.png`
- **Page class:** `Scenario6_InterfaceSettings`
- **UI elements:**
  - ComboBox, name=InterfaceSettingsToChoose
  - Button, name=ButtonSetSetting, label="Set Interface Setting", events=Click
  - Button, name=ButtonGetSetting, label="Get Interface Setting", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_InterfaceSettings.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Set Interface Setting "Set Interface Setting" (Button)
  - Get Interface Setting "Get Interface Setting" (Button)
- **Output elements:** GenericScenarioText, StatusBlock, StatusBorder

## Scenario 7 - Sync Device

- **Screenshot:** `screenshots/07_Sync_Device.png`
- **Page class:** `Scenario7_SyncDevice`
- **UI elements:**
  - Button, name=ButtonSync, label="Sync with the device", events=Click
  - Button, name=ButtonCancelSync, label="Cancel Sync with the device", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_SyncDevice.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Sync with the device "Sync with the device" (Button)
  - Cancel Sync with the device "Cancel Sync with the device" (Button)
- **Output elements:** GeneralScenarioText, ProgressBarText, StatusBlock, StatusBorder

