# Proximity sensor — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Data Events

- **Screenshot:** `screenshots/01_Data_Events.png`
- **Page class:** `Scenario1_DataEvents`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable", events=Click
  - Button, name=ScenarioDisableButton, label="Disable", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DataEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_DetectionState, ScenarioOutput_DetectionDistance, ScenarioOutput_Timestamp, StatusBorder, StatusBlock

## Scenario 2 - Polling

- **Screenshot:** `screenshots/02_Polling.png`
- **Page class:** `Scenario2_Polling`
- **UI elements:**
  - Button, name=ScenarioGetDataButton, label="Get Data", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Polling.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Data "Get Data" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_DetectionState, ScenarioOutput_DetectionDistance, ScenarioOutput_Timestamp, StatusBorder, StatusBlock

## Scenario 3 - Display On/Off

- **Screenshot:** `screenshots/03_Display_On_Off.png`
- **Page class:** `Scenario3_DisplayOnOff`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable", events=Click
  - Button, name=ScenarioDisableButton, label="Disable", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_DisplayOnOff.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** InputTextBlock, StatusBorder, StatusBlock

## Scenario 4 - Background Proximity Sensor

- **Screenshot:** `screenshots/04_Background_Proximity_Sensor.png`
- **Page class:** `Scenario4_BackgroundProximitySensor`
- **UI elements:**
  - Button, name=ScenarioRegisterTaskButton, label="Register Task", events=Click
  - Button, name=ScenarioUnregisterTaskButton, label="Unregister Task", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_BackgroundProximitySensor.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register Task "Register Task" (Button)
  - Unregister Task "Unregister Task" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_TaskRegistration, ScenarioOutput_TaskStatus, ScenarioOutput_ReportCount, ScenarioOutput_LastTimestamp, ScenarioOutput_Detected, StatusBorder, StatusBlock

