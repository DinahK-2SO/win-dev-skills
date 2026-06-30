# Lessons — CameraResolution (UWP→WinUI 3)

Build/run: **builds=true, runs=true, score=50** (3/3 scenarios `partial`). Layout and
navigation migrated faithfully; the recurring defect is purely **behavioral**.

## Root cause (single, recurring across all 3 scenarios)
The **Initialize Camera** action is dead in WinUI: the button disables on click and never
re-enables, and no Status message is shown — whereas the UWP golden shows a red
"The app was denied access to the camera" status.

Two compounding, generalizable causes in the migrated code:

1. **Narrow device-init catch.** `SampleConfiguration.InitializeCameraAsync()` catches
   only `UnauthorizedAccessException`. On a box with **no accessible camera** (the usual
   validation/dev environment, and unpackaged WinUI 3 doesn't honor the webcam capability
   like UWP), `MediaCapture.InitializeAsync()` throws a *different* exception
   (COMException `0xC00DABE0` / `FileNotFoundException`). It escapes uncaught.

2. **Disable-around-await without `finally`.** Each `InitializeCameraButton_Click` does
   `button.IsEnabled=false; await InitializeCameraAsync(); button.IsEnabled=true;`. When
   the await throws, the re-enable line is skipped → **permanently dead control**, and no
   `NotifyUser` runs → **no status feedback**.

## Why the existing skill didn't prevent it
SKILL.md has a good **"Defensive UI for init-heavy and device-dependent pages"** section,
but it only addresses init in the **constructor/Loaded** path (failure mode = *blank
frame*). Here the page renders fine; the failure is in an **async button-click handler**
(failure mode = *dead control + lost status*). That interactive path is not covered.

## What helped
- Bootstrap namespace rewrite + scaffold → clean build.
- The ctor-level defensive try/catch fallback was applied correctly (just not the path
  that mattered here).
