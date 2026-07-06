# Lamp device C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Get Lamp Instance

- **Screenshot:** `screenshots/01_Get_Lamp_Instance.png`
- **Page class:** `Scenario1_GetLamp`
- **UI elements:**
  - Button, label="Get Lamp Instance from DeviceInformation", events=Click
  - Button, label="Get Default Lamp Instance", events=Click
  - TextBox, name=outputBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_GetLamp.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Lamp Instance from DeviceInformation "Get Lamp Instance from DeviceInformation" (Button)
  - Get Default Lamp Instance "Get Default Lamp Instance" (Button)
- **Output elements:** outputBox, StatusBlock, StatusBorder

## Scenario 2 - Enable Lamp and Settings Adjustment

- **Screenshot:** `screenshots/02_Enable_Lamp_and_Settings_Adjustment.png`
- **Page class:** `Scenario2_EnableSettings`
- **UI elements:**
  - Button, label="Adjust Brightness and turn on Lamp", events=Click
  - Button, label="Adjust Color and turn on Lamp", events=Click
  - TextBox, name=outputBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_EnableSettings.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Adjust Brightness and turn on Lamp "Adjust Brightness and turn on Lamp" (Button)
  - Adjust Color and turn on Lamp "Adjust Color and turn on Lamp" (Button)
- **Output elements:** outputBox, StatusBlock, StatusBorder

## Scenario 3 - Lamp Device Change Events

- **Screenshot:** `screenshots/03_Lamp_Device_Change_Events.png`
- **Page class:** `Scenario3_AvailabilityChanged`
- **UI elements:**
  - Button, label="Register for AvailablityChanged Event", events=Click
  - Button, label="Unregister for AvailablityChanged Event", events=Click
  - ToggleSwitch, label="Lamp On", events=Toggled
  - TextBox, name=outputBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_AvailabilityChanged.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register for AvailablityChanged Event "Register for AvailablityChanged Event" (Button)
  - Unregister for AvailablityChanged Event "Unregister for AvailablityChanged Event" (Button)
  - Lamp On "Lamp On" (ToggleSwitch)
- **Output elements:** outputBox, StatusBlock, StatusBorder

