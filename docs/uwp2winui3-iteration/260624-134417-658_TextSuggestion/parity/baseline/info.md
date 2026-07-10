# TextSuggestion — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Conversion

- **Screenshot:** `screenshots/01_Conversion.png`
- **Page class:** `Scenario1_Conversion`
- **UI elements:**
  - Button, label="Create Generator", events=Click
  - Button, label="Execute", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Conversion.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Create Generator "Create Generator" (Button)
  - Execute "Execute" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 2 - Prediction

- **Screenshot:** `screenshots/02_Prediction.png`
- **Page class:** `Scenario2_Prediction`
- **UI elements:**
  - Button, label="Create Generator", events=Click
  - Button, label="Execute", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Prediction.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Create Generator "Create Generator" (Button)
  - Execute "Execute" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 3 - ReverseConversion

- **Screenshot:** `screenshots/03_ReverseConversion.png`
- **Page class:** `Scenario3_ReverseConversion`
- **UI elements:**
  - Button, label="Create Generator", events=Click
  - Button, label="Execute", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ReverseConversion.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Create Generator "Create Generator" (Button)
  - Execute "Execute" (Button)
- **Output elements:** StatusBlock, StatusBorder

