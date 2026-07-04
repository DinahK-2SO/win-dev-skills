# Geotag C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Geotag a file

- **Screenshot:** `screenshots/01_Geotag_a_file.png`
- **Page class:** `Scenario1_Geotag`
- **UI elements:**
  - Button, label="Choose file"
  - Button, label="Read geotag from file"
  - Button, label="Set geotag from geolocator"
  - Button, label="Set geotag to Seattle Space Needle"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Geotag.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Choose file "Choose file" (Button)
  - Read geotag from file "Read geotag from file" (Button)
  - Set geotag from geolocator "Set geotag from geolocator" (Button)
  - Set geotag to Seattle Space Needle "Set geotag to Seattle Space Needle" (Button)
- **Output elements:** FileDisplayName, StatusBorder, StatusBlock

