# CustomSerialDeviceAccess — behavioral baseline

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
- **Output elements:** StatusBlock, StatusBorder

## Scenario 2 - Configure Device

- **Screenshot:** `screenshots/02_Configure_Device.png`
- **Page class:** `Scenario2_ConfigureDevice`
- **UI elements:**
  - ToggleSwitch, name=BreakStateSignalToggleSwitch, label="On", events=Toggled
  - ToggleSwitch, name=DataTerminalReadyEnabledToggleSwitch, label="On", events=Toggled
  - ToggleSwitch, name=RequestToSendEnabledToggleSwitch, label="On", events=Toggled
  - TextBox, name=BaudRateInputValue, label="Enter Baud Rate"
  - Button, name=BaudRateSetButton, label="SET", events=Click
  - ComboBox, name=ParityComboBox, events=SelectionChanged
  - ComboBox, name=StopBitCountComboBox, events=SelectionChanged
  - ComboBox, name=HandShakeComboBox, events=SelectionChanged
  - ComboBox, name=DataBitsComboBox, events=SelectionChanged
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ConfigureDevice.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - On "On" (ToggleSwitch)
  - On "On" (ToggleSwitch)
  - On "On" (ToggleSwitch)
  - SET "SET" (Button)
- **Output elements:** CarrierDetectStateValue, DataSetReadyStateValue, BreakStateSignalValue, DataTerminalReadyEnabledValue, RequestToSendEnabledValue, BaudRateValue, BaudRateInputValue, ParityValue, StopBitCountValue, HandShakeValue, DataBitsValue, StatusBlock, StatusBorder

## Scenario 3 - Read/Write

- **Screenshot:** `screenshots/03_Read_Write.png`
- **Page class:** `Scenario3_ReadWrite`
- **UI elements:**
  - TextBox, name=WriteTimeoutInputValue, label="Enter Write Timeout"
  - Button, name=WriteTimeoutButton, label="SET", events=Click
  - TextBox, name=WriteBytesInputValue, label="Enter text to write", events=TextChanged
  - Button, name=WriteButton, label="WRITE BYTES", events=Click
  - Button, name=WriteCancelButton, label="CANCEL WRITE", events=Click
  - TextBox, name=ReadTimeoutInputValue, label="Enter Read Timeout"
  - Button, name=ReadTimeoutButton, label="SET", events=Click
  - Button, name=ReadButton, label="READ BYTES", events=Click
  - Button, name=ReadCancelButton, label="CANCEL READ", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ReadWrite.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - SET "SET" (Button)
  - WRITE BYTES "WRITE BYTES" (Button)
  - CANCEL WRITE "CANCEL WRITE" (Button)
  - SET "SET" (Button)
  - READ BYTES "READ BYTES" (Button)
  - CANCEL READ "CANCEL READ" (Button)
- **Output elements:** WriteTimeoutValue, WriteTimeoutInputValue, WriteBytesInputValue, WriteBytesCounterValue, WriteBytesTextBlock, ReadTimeoutValue, ReadTimeoutInputValue, ReadBytesCounterValue, ReadBytesTextBlock, StatusBlock, StatusBorder

## Scenario 4 - Events

- **Screenshot:** `screenshots/04_Events.png`
- **Page class:** `Scenario4_Events`
- **UI elements:**
  - ToggleSwitch, name=PinChangedToggleSwitch, label="On", events=Toggled
  - ToggleSwitch, name=ErrorReceivedToggleSwitch, label="On", events=Toggled
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_Events.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - On "On" (ToggleSwitch)
  - On "On" (ToggleSwitch)
- **Output elements:** PinChangedValue, ErrorReceivedValue, StatusBlock, StatusBorder

