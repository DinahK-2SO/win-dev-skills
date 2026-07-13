# ApplicationData — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Clear

- **Screenshot:** `screenshots/01_Clear.png`
- **Page class:** `Scenario6_ClearScenario`
- **UI elements:**
  - Button, name=Clear, label="Clear"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_ClearScenario.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Clear "Clear" (Button)
- **Output elements:** OutputTextBlock, StatusBorder, StatusBlock

## Scenario 2 - SetVersion

- **Screenshot:** `screenshots/02_SetVersion.png`
- **Page class:** `Scenario7_SetVersion`
- **UI elements:**
  - Button, name=SetVersion0, label="Set version to 0"
  - Button, name=SetVersion1, label="Set version to 1"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_SetVersion.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Set version to 0 "Set version to 0" (Button)
  - Set version to 1 "Set version to 1" (Button)
- **Output elements:** OutputTextBlock, StatusBorder, StatusBlock

