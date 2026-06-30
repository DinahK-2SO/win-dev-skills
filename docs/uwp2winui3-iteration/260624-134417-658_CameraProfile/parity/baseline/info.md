# CameraProfile — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Locate Record Specific Profile

- **Screenshot:** `screenshots/01_Locate_Record_Specific_Profile.png`
- **Page class:** `Scenario1_SetRecordProfile`
- **UI elements:**
  - Button, label="Find 640x480 30FPS Recording Profile", events=Click
  - Button, label="Find Custom Recording Profile", events=Click
  - TextBox, name=outputBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_SetRecordProfile.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Find 640x480 30FPS Recording Profile "Find 640x480 30FPS Recording Profile" (Button)
  - Find Custom Recording Profile "Find Custom Recording Profile" (Button)
- **Output elements:** outputBox, StatusBlock, StatusBorder

## Scenario 2 - Query Profile for Concurrency

- **Screenshot:** `screenshots/02_Query_Profile_for_Concurrency.png`
- **Page class:** `Scenario2_ConcurrentProfile`
- **UI elements:**
  - Button, label="Query for Concurrent Profile", events=Click
  - TextBox, name=outputBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ConcurrentProfile.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Query for Concurrent Profile "Query for Concurrent Profile" (Button)
- **Output elements:** outputBox, StatusBlock, StatusBorder

## Scenario 3 - Query Profile for HDR Support

- **Screenshot:** `screenshots/03_Query_Profile_for_HDR_Support.png`
- **Page class:** `Scenario3_EnableHdrProfile`
- **UI elements:**
  - Button, label="Query Profile for HDR Support", events=Click
  - TextBox, name=outputBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_EnableHdrProfile.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Query Profile for HDR Support "Query Profile for HDR Support" (Button)
- **Output elements:** outputBox, StatusBlock, StatusBorder

