# Camera resolution C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Change camera preview settings

- **Screenshot:** `screenshots/01_Change_camera_preview_settings.png`
- **Page class:** `Scenario1_PreviewSettings`
- **UI elements:**
  - ComboBox, label="Preview Settings"
  - Button, label="Initialize Camera"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_PreviewSettings.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Initialize Camera "Initialize Camera" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Change preview and photo settings

- **Screenshot:** `screenshots/02_Change_preview_and_photo_settings.png`
- **Page class:** `Scenario2_PhotoSettings`
- **UI elements:**
  - ComboBox, label="Preview Settings"
  - ComboBox, label="Photo Settings"
  - Button, label="Initialize Camera"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_PhotoSettings.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Initialize Camera "Initialize Camera" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Match aspect ratios

- **Screenshot:** `screenshots/03_Match_aspect_ratios.png`
- **Page class:** `Scenario3_AspectRatio`
- **UI elements:**
  - ComboBox, label="Preview Settings"
  - ComboBox, label="Video Settings"
  - Button, label="Initialize Camera"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_AspectRatio.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Initialize Camera "Initialize Camera" (Button)
- **Output elements:** StatusBorder, StatusBlock

