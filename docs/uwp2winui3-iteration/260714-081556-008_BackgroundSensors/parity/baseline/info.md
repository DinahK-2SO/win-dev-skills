# Background sensors — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Accelerometer DeviceUse

- **Screenshot:** `screenshots/01_Accelerometer_DeviceUse.png`
- **Page class:** `Scenario1_DeviceUse`
- **UI elements:**
  - Button, name=ScenarioEnableButton, label="Enable"
  - Button, name=ScenarioDisableButton, label="Disable"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DeviceUse.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Enable "Enable" (Button)
  - Disable "Disable" (Button)
- **Output elements:** ScenarioOutput_SampleCount, StatusBorder, StatusBlock

