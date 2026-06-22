# Accelerometer C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Choose accelerometer

- **Screenshot:** `screenshots/01_Choose_accelerometer.png`
- **Page class:** `Scenario0_Choose`
- **UI elements:**
  - ComboBox, name=ReadingTypeComboBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario0_Choose.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Data events

- **Screenshot:** `screenshots/02_Data_events.png`
- **Page class:** `Scenario1_DataEvents`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DataEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutput, StatusBorder, StatusBlock

## Scenario 3 - Shake events

- **Screenshot:** `screenshots/03_Shake_events.png`
- **Page class:** `Scenario2_ShakeEvents`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ShakeEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutputText, StatusBorder, StatusBlock

## Scenario 4 - Polling

- **Screenshot:** `screenshots/04_Polling.png`
- **Page class:** `Scenario3_Polling`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_Polling.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutput, StatusBorder, StatusBlock

## Scenario 5 - Orientation change

- **Screenshot:** `screenshots/05_Orientation_change.png`
- **Page class:** `Scenario4_OrientationChanged`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_OrientationChanged.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutputOriginal, ScenarioOutputReadingTransform, StatusBorder, StatusBlock

## Scenario 6 - Data events batching

- **Screenshot:** `screenshots/06_Data_events_batching.png`
- **Page class:** `Scenario5_DataEventsBatching`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_DataEventsBatching.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutput, StatusBorder, StatusBlock

