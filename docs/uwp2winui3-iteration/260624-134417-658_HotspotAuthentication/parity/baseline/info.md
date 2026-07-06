# Hotspot Authentication — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Initialization

- **Screenshot:** `screenshots/01_Initialization.png`
- **Page class:** `Scenario1_Initialization`
- **UI elements:**
  - Button, name=ProvisionButton, label="Provision", events=Click
  - Button, name=RegisterButton, label="Register", events=Click
  - Button, name=UnregisterButton, label="Unregister", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Initialization.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Provision "Provision" (Button)
  - Register "Register" (Button)
  - Unregister "Unregister" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Authentication by background task

- **Screenshot:** `screenshots/02_Authentication_by_background_task.png`
- **Page class:** `Scenario2_BackgroundTask`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_BackgroundTask.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Authentication by foreground app

- **Screenshot:** `screenshots/03_Authentication_by_foreground_app.png`
- **Page class:** `Scenario3_ForegroundApp`
- **UI elements:**
  - Button, name=AuthenticateButton, label="Authenticate", events=Click
  - Button, name=SkipButton, label="Skip", events=Click
  - Button, name=AbortButton, label="Abort", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ForegroundApp.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Authenticate "Authenticate" (Button)
  - Skip "Skip" (Button)
  - Abort "Abort" (Button)
- **Output elements:** StatusBorder, StatusBlock

