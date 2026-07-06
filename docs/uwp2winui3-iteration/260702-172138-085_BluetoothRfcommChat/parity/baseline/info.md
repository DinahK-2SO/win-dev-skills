# Bluetooth Rfcomm Chat Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Chat Client

- **Screenshot:** `screenshots/01_Chat_Client.png`
- **Page class:** `Scenario1_ChatClient`
- **UI elements:**
  - Button, name=RunButton, label="Start", events=Click
  - Button, name=ConnectButton, label="Connect to Selected Device", events=Click
  - Button, name=RequestAccessButton, label="Request Access to Trusted Device", events=Click
  - ListView, name=resultsListView, events=SelectionChanged
  - Button, name=DisconnectButton, label="Disconnect", events=Click
  - TextBox, name=MessageTextBox
  - Button, name=SendButton, label="Send", events=Click
  - ListBox, name=ConversationList
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_ChatClient.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start "Start" (Button)
  - Connect to Selected Device "Connect to Selected Device" (Button)
  - Request Access to Trusted Device "Request Access to Trusted Device" (Button)
  - Disconnect "Disconnect" (Button)
  - Send "Send" (Button)
- **Output elements:** DeviceName, ServiceName, MessageTextBox, StatusBorder, StatusBlock

## Scenario 2 - Foreground Chat Server

- **Screenshot:** `screenshots/02_Foreground_Chat_Server.png`
- **Page class:** `Scenario2_ChatServer`
- **UI elements:**
  - Button, name=DisconnectButton, label="Disconnect", events=Click
  - TextBox, name=MessageTextBox
  - Button, name=SendButton, label="Send", events=Click
  - ListBox, name=ConversationListBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ChatServer.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Disconnect "Disconnect" (Button)
  - Send "Send" (Button)
- **Output elements:** InputTextBlock1, MessageTextBox, StatusBorder, StatusBlock

## Scenario 3 - Background Chat Server

- **Screenshot:** `screenshots/03_Background_Chat_Server.png`
- **Page class:** `Scenario3_BgChatServer`
- **UI elements:**
  - Button, name=DisconnectButton, label="Disconnect", events=Click
  - TextBox, name=MessageTextBox
  - Button, name=SendButton, label="Send", events=Click
  - ListBox, name=ConversationListBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_BgChatServer.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Disconnect "Disconnect" (Button)
  - Send "Send" (Button)
- **Output elements:** InputTextBlock1, MessageTextBox, StatusBorder, StatusBlock

