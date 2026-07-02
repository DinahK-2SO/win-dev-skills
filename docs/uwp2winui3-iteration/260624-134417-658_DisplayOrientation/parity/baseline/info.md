# Display orientation — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Show and lock orientation

- **Screenshot:** `screenshots/01_Show_and_lock_orientation.png`
- **Page class:** `Scenario1_Orientation`
- **UI elements:**
  - CheckBox, name=PreferLandscape, label="Prefer landscape"
  - CheckBox, name=PreferPortrait, label="Prefer portrait"
  - CheckBox, name=PreferLandscapeFlipped, label="Prefer landscape flipped"
  - CheckBox, name=PreferPortraitFlipped, label="Prefer portrait flipped"
  - Button, label="Apply preferences"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Orientation.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Apply preferences "Apply preferences" (Button)
- **Output elements:** NativeOrientationTextBlock, CurrentOrientationTextBlock, AutoRotationPreferencesTextBlock, StatusBorder, StatusBlock

