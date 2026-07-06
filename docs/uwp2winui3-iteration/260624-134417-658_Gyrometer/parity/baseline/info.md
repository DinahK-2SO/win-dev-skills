# Gyrometer — behavioral baseline

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
- **Output elements:** InputTextBlock, ScenarioOutput_X, ScenarioOutput_Y, ScenarioOutput_Z, StatusBorder, StatusBlock

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
- **Output elements:** InputTextBlock, ScenarioOutput_X, ScenarioOutput_Y, ScenarioOutput_Z, StatusBorder, StatusBlock

## Scenario 3 - Cross-Platform Porting

- **Screenshot:** `screenshots/03_Cross_Platform_Porting.png`
- **Page class:** `Scenario3_Porting`
- **UI elements:**
  - Button, name=GetSampleButton, label="Get Sample", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_Porting.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Sample "Get Sample" (Button)
- **Output elements:** InputTextBlock, ScenarioOutput_X_Windows, ScenarioOutput_Y_Windows, ScenarioOutput_Z_Windows, ScenarioOutput_X_WP, ScenarioOutput_Y_WP, ScenarioOutput_Z_WP, StatusBorder, StatusBlock

