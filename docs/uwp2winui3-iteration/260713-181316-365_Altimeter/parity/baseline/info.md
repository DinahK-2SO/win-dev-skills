# Altimeter — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Data Events

- **Screenshot:** `screenshots/01_Data_Events.png`
- **Page class:** `Scenario1_DataEvents`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DataEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_M, StatusBorder, StatusBlock

## Scenario 2 - Polling

- **Screenshot:** `screenshots/02_Polling.png`
- **Page class:** `Scenario2_Polling`
- **UI elements:**
  - Button, name=ScenarioGetDataButton, label="Get Data"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Polling.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Data "Get Data" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_M, StatusBorder, StatusBlock

