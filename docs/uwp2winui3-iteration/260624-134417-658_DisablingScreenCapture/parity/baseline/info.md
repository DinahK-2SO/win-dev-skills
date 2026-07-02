# Disabling screen capture C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Enabling screen capture

- **Screenshot:** `screenshots/01_Enabling_screen_capture.png`
- **Page class:** `Scenario1_Enable`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Enable.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Disabling screen capture

- **Screenshot:** `screenshots/02_Disabling_screen_capture.png`
- **Page class:** `Scenario2_Disable`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Disable.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Managing AppCapture

- **Screenshot:** `screenshots/03_Managing_AppCapture.png`
- **Page class:** `Scenario3_AppCapture`
- **UI elements:**
  - ToggleSwitch, name=AllowAppCaptureCheckBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_AppCapture.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - AllowAppCaptureCheckBox (ToggleSwitch)
- **Output elements:** StatusBorder, StatusBlock

