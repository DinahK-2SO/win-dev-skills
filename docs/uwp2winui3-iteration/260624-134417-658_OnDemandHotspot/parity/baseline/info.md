# OnDemandHotspot C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Manage Hotspot

- **Screenshot:** `screenshots/01_Manage_Hotspot.png`
- **Page class:** `Scenario1_ManageHotspot`
- **UI elements:**
  - Button, label="Register tasks"
  - Button, label="Unregister tasks"
  - TextBox, name=DisplayNameText, label="Provide a name for the on-demand hotspot"
  - ToggleSwitch, name=AvailableToggle
  - ToggleSwitch, name=CellularBarsToggle
  - Slider, name=CellularBarsSlider
  - ToggleSwitch, name=BatteryPercentageToggle
  - Slider, name=BatteryPercentageSlider
  - TextBox, name=SsidText, label="Required"
  - PasswordBox, name=PasswordText, label="Required"
  - Button, label="Update now"
  - Button, label="Update when user opens Wi-Fi network list"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_ManageHotspot.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Register tasks "Register tasks" (Button)
  - Unregister tasks "Unregister tasks" (Button)
  - AvailableToggle (ToggleSwitch)
  - CellularBarsToggle (ToggleSwitch)
  - BatteryPercentageToggle (ToggleSwitch)
  - Update now "Update now" (Button)
  - Update when user opens Wi-Fi network list "Update when user opens Wi-Fi network list" (Button)
- **Output elements:** DisplayNameText, SsidText, StatusBorder, StatusBlock

