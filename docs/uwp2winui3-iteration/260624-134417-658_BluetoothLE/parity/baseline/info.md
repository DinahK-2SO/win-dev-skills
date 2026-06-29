# Bluetooth Low Energy C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Client: Discover servers

- **Screenshot:** `screenshots/01_Client_Discover_servers.png`
- **Page class:** `Scenario1_Discovery`
- **UI elements:**
  - Button, name=EnumerateButton, label="Start enumerating"
  - Button, name=PairButton, label="Pair"
  - ListView, name=ResultsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Discovery.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start enumerating "Start enumerating" (Button)
  - Pair "Pair" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Client: Connect to a server

- **Screenshot:** `screenshots/02_Client_Connect_to_a_server.png`
- **Page class:** `Scenario2_Client`
- **UI elements:**
  - Button, name=ConnectButton, label="Connect"
  - ComboBox, name=ServiceList, label="Choose a service"
  - ComboBox, name=CharacteristicList, label="Choose a characteristic"
  - Button, name=CharacteristicReadButton, label="Read Value"
  - Button, name=ValueChangedSubscribeToggle, label="Subscribe to value changes"
  - TextBox, name=CharacteristicWriteValue, label="Enter text/number to send"
  - Button, label="Write Value as Number"
  - Button, label="Write Value as UTF-8"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Client.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Connect "Connect" (Button)
  - Read Value "Read Value" (Button)
  - Subscribe to value changes "Subscribe to value changes" (Button)
  - Write Value as Number "Write Value as Number" (Button)
  - Write Value as UTF-8 "Write Value as UTF-8" (Button)
- **Output elements:** SelectedDeviceRun, CharacteristicWriteValue, CharacteristicLatestValue, StatusBorder, StatusBlock

## Scenario 3 - Server: Publish foreground

- **Screenshot:** `screenshots/03_Server_Publish_foreground.png`
- **Page class:** `Scenario3_ServerForeground`
- **UI elements:**
  - CheckBox, name=Publishing2MPHY
  - Button, name=PublishButton, label="Start Service"
  - TextBox, label="0"
  - TextBox, label="INV"
  - TextBox, label="0"
  - TextBox, label="0"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ServerForeground.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Service "Start Service" (Button)
- **Output elements:** ServiceIdRun, PeripheralWarning, Publishing2MPHYReasonRun, OperationLabel, StatusBorder, StatusBlock

## Scenario 4 - Server: Publish background

- **Screenshot:** `screenshots/04_Server_Publish_background.png`
- **Page class:** `Scenario4_ServerBackground`
- **UI elements:**
  - CheckBox, name=Publishing2MPHY
  - Button, name=PublishButton, label="Start Service"
  - TextBox, label="0"
  - TextBox, label="INV"
  - TextBox, label="0"
  - TextBox, label="0"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_ServerBackground.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Service "Start Service" (Button)
- **Output elements:** ServiceIdRun, PeripheralWarning, Publishing2MPHYReasonRun, OperationLabel, StatusBorder, StatusBlock

