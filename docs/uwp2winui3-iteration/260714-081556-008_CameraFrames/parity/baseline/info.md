# Camera Frames — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Shared mode access to color, depth and infrared frame sources

- **Screenshot:** `screenshots/01_Shared_mode_access_to_color_depth_and_infrared_frame_sources.png`
- **Page class:** `Scenario1_DisplayDepthColorIR`
- **UI elements:**
  - Button, name=NextButton, label="Next Source Group"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_DisplayDepthColorIR.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Next Source Group "Next Source Group" (Button)
- **Output elements:** outputTextBlock, StatusBorder, StatusBlock

## Scenario 2 - Find and display all media frame sources

- **Screenshot:** `screenshots/02_Find_and_display_all_media_frame_sources.png`
- **Page class:** `Scenario2_FindAvailableSourceGroups`
- **UI elements:**
  - ComboBox, label="Select ..."
  - ComboBox, label="Select ..."
  - ComboBox, label="Default format"
  - Button, label="Start"
  - Button, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_FindAvailableSourceGroups.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start "Start" (Button)
  - Stop "Stop" (Button)
- **Output elements:** outputTextBlock, StatusBorder, StatusBlock

