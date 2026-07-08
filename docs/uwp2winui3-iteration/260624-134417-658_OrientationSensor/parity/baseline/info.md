# Orientation Sensor C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Choose orientation sensor

- **Screenshot:** `screenshots/01_Choose_orientation_sensor.png`
- **Page class:** `Scenario0_Choose`
- **UI elements:**
  - ComboBox, name=ReadingTypeComboBox
  - ComboBox, name=OptimizationGoalComboBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario0_Choose.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Data Events

- **Screenshot:** `screenshots/02_Data_Events.png`
- **Page class:** `Scenario1_DataEvents`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DataEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutput, StatusBorder, StatusBlock

## Scenario 3 - Polling

- **Screenshot:** `screenshots/03_Polling.png`
- **Page class:** `Scenario2_Polling`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Polling.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutput, StatusBorder, StatusBlock

## Scenario 4 - Calibration

- **Screenshot:** `screenshots/04_Calibration.png`
- **Page class:** `Scenario3_Calibration`
- **UI elements:**
  - RadioButton, label="High"
  - RadioButton, label="Approximate"
  - RadioButton, label="Unreliable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_Calibration.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - High "High" (RadioButton)
  - Approximate "Approximate" (RadioButton)
  - Unreliable "Unreliable" (RadioButton)
- **Output elements:** DisabledContent, StatusBorder, StatusBlock

