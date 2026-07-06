# Inclinometer — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Data events

- **Screenshot:** `screenshots/01_Data_events.png`
- **Page class:** `Scenario1_DataEvents`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable", events=Click
  - Button, name=ScenarioDisableButton, label="Disable", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DataEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_X, ScenarioOutput_Y, ScenarioOutput_Z, ScenarioOutput_YawAccuracy, StatusBorder, StatusBlock

## Scenario 2 - Polling

- **Screenshot:** `screenshots/02_Polling.png`
- **Page class:** `Scenario2_Polling`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable", events=Click
  - Button, name=ScenarioDisableButton, label="Disable", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Polling.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_X, ScenarioOutput_Y, ScenarioOutput_Z, ScenarioOutput_YawAccuracy, StatusBorder, StatusBlock

## Scenario 3 - Calibration

- **Screenshot:** `screenshots/03_Calibration.png`
- **Page class:** `Scenario3_Calibration`
- **UI elements:**
  - RadioButton, label="High", events=Click
  - RadioButton, label="Approximate", events=Click
  - RadioButton, label="Unreliable", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_Calibration.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - High "High" (RadioButton)
  - Approximate "Approximate" (RadioButton)
  - Unreliable "Unreliable" (RadioButton)
- **Output elements:** InputTextBlock, StatusBorder, StatusBlock

