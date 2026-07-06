# LampArray C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - LampArray Basics

- **Screenshot:** `screenshots/01_LampArray_Basics.png`
- **Page class:** `Scenario1_Basics`
- **UI elements:**
  - RadioButton, name=OffButton
  - RadioButton, name=SetColorButton
  - RadioButton, name=GradientButton
  - RadioButton, name=WasdButton
  - Slider, name=BrightnessSlider, label="Brightness"
  - Button, label="Apply"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Basics.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - OffButton (RadioButton)
  - SetColorButton (RadioButton)
  - GradientButton (RadioButton)
  - WasdButton (RadioButton)
  - Apply "Apply" (Button)
- **Output elements:** LampArraysSummary, StatusBorder, StatusBlock

## Scenario 2 - LampArray Effects

- **Screenshot:** `screenshots/02_LampArray_Effects.png`
- **Page class:** `Scenario2_Effects`
- **UI elements:**
  - Button, name=PauseButton
  - Button, name=PlayButton
  - Button, name=StopButton
  - Image, name=ImageBitmap
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Effects.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - PauseButton (Button)
  - PlayButton (Button)
  - StopButton (Button)
- **Output elements:** LampArraysSummary, StatusBorder, StatusBlock

