# CredentialPicker — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Message

- **Screenshot:** `screenshots/01_Message.png`
- **Page class:** `Scenario1_Message`
- **UI elements:**
  - TextBox, name=Message, label="Enter your credentials"
  - TextBox, name=Target, label="contoso.com"
  - Button, name=Launch, label="Launch", events=Click
  - TextBox, name=Domain
  - TextBox, name=Username
  - TextBox, name=Password
  - TextBox, name=CredentialSaved
  - TextBox, name=CheckboxState
  - TextBox, name=Status
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Message.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Launch "Launch" (Button)
- **Output elements:** MessageLabel, Message, TargetLabel, Target, Domain, Username, Password, PasswordExplain1, PasswordExplain2, CredentialSaved, CheckboxState, Status, StatusBlock, StatusBorder

## Scenario 2 - Message+Caption

- **Screenshot:** `screenshots/02_Message_Caption.png`
- **Page class:** `Scenario2_MessageCaption`
- **UI elements:**
  - TextBox, name=Message, label="Enter your credentials"
  - TextBox, name=Caption, label="WindowCaption"
  - TextBox, name=Target, label="contoso.com"
  - Button, name=Launch, label="Launch", events=Click
  - TextBox, name=Domain
  - TextBox, name=Username
  - TextBox, name=Password
  - TextBox, name=CredentialSaved
  - TextBox, name=CheckboxState
  - TextBox, name=Status
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_MessageCaption.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Launch "Launch" (Button)
- **Output elements:** Message, Caption, Target, Domain, Username, Password, PasswordExplain1, PasswordExplain2, CredentialSaved, CheckboxState, Status, StatusBlock, StatusBorder

## Scenario 3 - CredentialPickerOptions

- **Screenshot:** `screenshots/03_CredentialPickerOptions.png`
- **Page class:** `Scenario3_CredentialPickerOptions`
- **UI elements:**
  - TextBox, name=Message, label="Enter your credentials"
  - TextBox, name=Caption, label="WindowCaption"
  - TextBox, name=Target, label="contoso.com"
  - ComboBox, name=SaveCheckboxSelection
  - ComboBox, name=ProtocolSelection, events=SelectionChanged
  - TextBox, name=CustomProtocol, label="CustomProtocolName"
  - CheckBox, name=AlwaysShowDialog
  - Button, name=Launch, label="Launch", events=Click
  - TextBox, name=Domain
  - TextBox, name=Username
  - TextBox, name=Password
  - TextBox, name=CredentialSaved
  - TextBox, name=CheckboxState
  - TextBox, name=Status
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_CredentialPickerOptions.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Launch "Launch" (Button)
- **Output elements:** Message, Caption, Target, CustomProtocol, Domain, Username, Password, PasswordExplain1, PasswordExplain2, CredentialSaved, CheckboxState, Status, StatusBlock, StatusBorder

