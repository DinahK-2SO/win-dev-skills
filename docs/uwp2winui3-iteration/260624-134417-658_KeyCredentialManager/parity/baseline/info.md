# KeyCredentialManager C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Sign In Scenario

- **Screenshot:** `screenshots/01_Sign_In_Scenario.png`
- **Page class:** `UserSelect`
- **UI elements:**
  - ListView, name=listView_UserTileList
  - Button, label="+", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `UserSelect.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - + "+" (Button)
- **Output elements:** StatusBorder, StatusBlock

