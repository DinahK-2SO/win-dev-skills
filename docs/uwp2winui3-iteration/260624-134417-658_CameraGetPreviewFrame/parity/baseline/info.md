# CameraGetPreviewFrame — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - CameraGetPreviewFrame

- **Screenshot:** `screenshots/01_CameraGetPreviewFrame.png`
- **Page class:** `MainPage`
- **UI elements:**
  - Button, label="GetPreviewFrameAsync"
  - CheckBox, label="Show frame"
  - CheckBox, label="Green effect"
  - CheckBox, label="Save frame"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `MainPage.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - GetPreviewFrameAsync "GetPreviewFrameAsync" (Button)

