# MIDI — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - MIDI Device Enumeration

- **Screenshot:** `screenshots/01_MIDI_Device_Enumeration.png`
- **Page class:** `Scenario1_MIDIDeviceEnumeration`
- **UI elements:**
  - ToggleSwitch, name=deviceAutoDetectToggle, events=Toggled
  - Button, name=listInputDevicesButton, label="List all input devices", events=Click
  - ListBox, name=inputDevices, events=SelectionChanged
  - ListBox, name=inputDeviceProperties
  - Button, name=listOutputDevicesButton, label="List all output devices", events=Click
  - ListBox, name=outputDevices, events=SelectionChanged
  - ListBox, name=outputDeviceProperties
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_MIDIDeviceEnumeration.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - deviceAutoDetectToggle (ToggleSwitch)
  - List all input devices "List all input devices" (Button)
  - List all output devices "List all output devices" (Button)
- **Output elements:** deviceAutoDetectToggleLabel, listInputDevicesButtonLabel, listOutputDevicesButtonLabel, statusBlock, StatusBorder, StatusBlock

## Scenario 2 - Receive MIDI Messages

- **Screenshot:** `screenshots/02_Receive_MIDI_Messages.png`
- **Page class:** `Scenario2_ReceiveMIDIMessages`
- **UI elements:**
  - ListBox, name=inputDevices, events=SelectionChanged
  - ListBox, name=inputDeviceMessages
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ReceiveMIDIMessages.xaml.cs`)_
- **Output elements:** inputDevicesLabel, inputDeviceMessagesLabel, statusBlock, StatusBorder, StatusBlock

## Scenario 3 - Send MIDI Messages

- **Screenshot:** `screenshots/03_Send_MIDI_Messages.png`
- **Page class:** `Scenario3_SendMIDIMessages`
- **UI elements:**
  - ListBox, name=outputDevices, events=SelectionChanged
  - ComboBox, name=messageType, events=SelectionChanged
  - ComboBox, name=parameter1, label="Parameter 1", events=SelectionChanged
  - ComboBox, name=parameter2, label="Parameter 2", events=SelectionChanged
  - ComboBox, name=parameter3, label="Parameter 3", events=SelectionChanged
  - TextBox, name=sysExMessageContent
  - Button, name=resetButton, label="Reset", events=Click
  - Button, name=sendButton, label="Send", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_SendMIDIMessages.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Reset "Reset" (Button)
  - Send "Send" (Button)
- **Output elements:** outputDevicesLabel, messageTypeLabel, rawBufferHeader, sysExMessageContent, statusBlock, StatusBorder, StatusBlock

