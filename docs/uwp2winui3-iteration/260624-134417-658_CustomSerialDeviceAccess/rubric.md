# Parity Rubric - CustomSerialDeviceAccess

Ground truth: original UWP app at `C:\ado\win-dev-skills-benchmark\agent-benchmark\uwp-samples-standalone\Samples\CustomSerialDeviceAccess\cs`.
Each scenario is graded pass (1) / partial (0.5) / fail (0). A control that responds in the UWP golden but is dead in WinUI is at best partial.

## Scenario 1 - Connect/Disconnect
Controls:
- ButtonConnectToDevice (Button) - 'Connect to device'
- ButtonDisconnectFromDevice (Button) - 'Disconnect from device'
- ConnectDevices (ListBox)
Actions to actuate:
- Connect to device -> ButtonConnectToDevice [Click]
- Disconnect from device -> ButtonDisconnectFromDevice [Click]

## Scenario 2 - Configure Device
Controls:
- BreakStateSignalToggleSwitch (ToggleSwitch) - 'On'
- DataTerminalReadyEnabledToggleSwitch (ToggleSwitch) - 'On'
- RequestToSendEnabledToggleSwitch (ToggleSwitch) - 'On'
- BaudRateInputValue (TextBox) - 'Enter Baud Rate'
- BaudRateSetButton (Button) - 'SET'
- ParityComboBox (ComboBox)
- StopBitCountComboBox (ComboBox)
- HandShakeComboBox (ComboBox)
- DataBitsComboBox (ComboBox)
Actions to actuate:
- On -> BreakStateSignalToggleSwitch [Toggled]
- On -> DataTerminalReadyEnabledToggleSwitch [Toggled]
- On -> RequestToSendEnabledToggleSwitch [Toggled]
- SET -> BaudRateSetButton [Click]

## Scenario 3 - Read/Write
Controls:
- WriteTimeoutInputValue (TextBox) - 'Enter Write Timeout'
- WriteTimeoutButton (Button) - 'SET'
- WriteBytesInputValue (TextBox) - 'Enter text to write'
- WriteButton (Button) - 'WRITE BYTES'
- WriteCancelButton (Button) - 'CANCEL WRITE'
- ReadTimeoutInputValue (TextBox) - 'Enter Read Timeout'
- ReadTimeoutButton (Button) - 'SET'
- ReadButton (Button) - 'READ BYTES'
- ReadCancelButton (Button) - 'CANCEL READ'
Actions to actuate:
- SET -> WriteTimeoutButton [Click]
- WRITE BYTES -> WriteButton [Click]
- CANCEL WRITE -> WriteCancelButton [Click]
- SET -> ReadTimeoutButton [Click]
- READ BYTES -> ReadButton [Click]
- CANCEL READ -> ReadCancelButton [Click]

## Scenario 4 - Events
Controls:
- PinChangedToggleSwitch (ToggleSwitch) - 'On'
- ErrorReceivedToggleSwitch (ToggleSwitch) - 'On'
Actions to actuate:
- On -> PinChangedToggleSwitch [Toggled]
- On -> ErrorReceivedToggleSwitch [Toggled]

