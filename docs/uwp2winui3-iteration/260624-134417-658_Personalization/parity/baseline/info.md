# Lock screen personalization C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Pick and set lock screen image

- **Screenshot:** `screenshots/01_Pick_and_set_lock_screen_image.png`
- **Page class:** `SetLockScreenImage`
- **UI elements:**
  - Button, name=PickAndSetButton, label="Pick and set lock screen image"
  - Image, name=LockScreenImage
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `SetLockScreenImage.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Pick and set lock screen image "Pick and set lock screen image" (Button)
- **Output elements:** InputTextBlock1, StatusBorder, StatusBlock

