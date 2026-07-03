# DPI scaling — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Load images for different scales

- **Screenshot:** `screenshots/01_Load_images_for_different_scales.png`
- **Page class:** `Scenario1`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1.xaml.cs`)_
- **Output elements:** ScalingText, LogicalDPIText, ManualLoadURL, StatusBorder, StatusBlock

## Scenario 2 - Override default scaling of UI elements

- **Screenshot:** `screenshots/02_Override_default_scaling_of_UI_elements.png`
- **Page class:** `Scenario2`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2.xaml.cs`)_
- **Output elements:** ResolutionTextBlock, DefaultRelativePx, DefaultPhysicalPx, DefaultLayoutText, OverrideRelativePx, OverridePhysicalPx, OverrideLayoutText, StatusBorder, StatusBlock

