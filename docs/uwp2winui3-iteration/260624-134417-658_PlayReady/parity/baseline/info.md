# PlayReady C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Reactive License Request

- **Screenshot:** `screenshots/01_Reactive_License_Request.png`
- **Page class:** `Scenario1_ReactiveRequest`
- **UI elements:**
  - TextBox, label="{Binding MoviePath, Mode=TwoWay}"
  - Button, label="Play"
  - Button, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_ReactiveRequest.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Play "Play" (Button)
  - Stop "Stop" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Proactive License Request

- **Screenshot:** `screenshots/02_Proactive_License_Request.png`
- **Page class:** `Scenario2_ProactiveRequest`
- **UI elements:**
  - Button, label="Get License"
  - TextBox, label="{Binding KeyId, Mode=TwoWay}"
  - TextBox, label="{Binding MoviePath, Mode=TwoWay}"
  - Button, label="Play"
  - Button, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ProactiveRequest.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get License "Get License" (Button)
  - Play "Play" (Button)
  - Stop "Stop" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Manage HW/SW DRM

- **Screenshot:** `screenshots/03_Manage_HW_SW_DRM.png`
- **Page class:** `Scenario3_HardwareDRM`
- **UI elements:**
  - Button, label="Use Hardware DRM"
  - Button, label="Use Software DRM"
  - TextBox, label="{Binding MoviePath, Mode=TwoWay}"
  - Button, label="Play"
  - Button, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_HardwareDRM.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Use Hardware DRM "Use Hardware DRM" (Button)
  - Use Software DRM "Use Software DRM" (Button)
  - Play "Play" (Button)
  - Stop "Stop" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Secure Stop

- **Screenshot:** `screenshots/04_Secure_Stop.png`
- **Page class:** `Scenario4_SecureStop`
- **UI elements:**
  - Button, label="Get Publisher Cert"
  - Button, label="Renew License"
  - TextBox, label="{Binding MoviePath, Mode=TwoWay}"
  - Button, label="Play"
  - Button, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_SecureStop.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Publisher Cert "Get Publisher Cert" (Button)
  - Renew License "Renew License" (Button)
  - Play "Play" (Button)
  - Stop "Stop" (Button)
- **Output elements:** StatusBorder, StatusBlock

