# Account picture name C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Find users

- **Screenshot:** `screenshots/01_Find_users.png`
- **Page class:** `Scenario1_FindUsers`
- **UI elements:**
  - ComboBox, name=UserList
  - Button, label="Show properties"
  - Image, name=ProfileImage
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_FindUsers.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Show properties "Show properties" (Button)
- **Output elements:** ResultsText, StatusBorder, StatusBlock

## Scenario 2 - Watch users

- **Screenshot:** `screenshots/02_Watch_users.png`
- **Page class:** `Scenario2_WatchUsers`
- **UI elements:**
  - Button, name=StartButton, label="Start watching"
  - Button, name=StopButton, label="Stop watching"
  - ListBox, name=UserList
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_WatchUsers.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start watching "Start watching" (Button)
  - Stop watching "Stop watching" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Check user consent group

- **Screenshot:** `screenshots/03_Check_user_consent_group.png`
- **Page class:** `Scenario3_CheckUserConsentGroup`
- **UI elements:**
  - ComboBox, name=UserList
  - Button, label="Show Consent Group"
  - Image, name=ProfileImage
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_CheckUserConsentGroup.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Show Consent Group "Show Consent Group" (Button)
- **Output elements:** ResultsText, StatusBorder, StatusBlock

