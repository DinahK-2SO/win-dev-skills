# MobileHotspot C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Configure Mobile Hotspot

- **Screenshot:** `screenshots/01_Configure_Mobile_Hotspot.png`
- **Page class:** `Scenario1_ConfigureMobileHotspot`
- **UI elements:**
  - TextBox, name=SsidTextBox
  - TextBox, name=PassphraseTextBox
  - ComboBox, name=BandComboBox
  - ComboBox, name=AuthenticationComboBox
  - Button, label="Apply changes"
  - Button, label="Discard changes"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_ConfigureMobileHotspot.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Apply changes "Apply changes" (Button)
  - Discard changes "Discard changes" (Button)
- **Output elements:** SsidLabel, SsidTextBox, PassphraseLabel, PassphraseTextBox, BandLabel, AuthenticationLabel, StatusBorder, StatusBlock

## Scenario 2 - Toggle Mobile Hotspot

- **Screenshot:** `screenshots/02_Toggle_Mobile_Hotspot.png`
- **Page class:** `Scenario2_ToggleMobileHotspot`
- **UI elements:**
  - ToggleSwitch, name=MobileHotspotToggle
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ToggleMobileHotspot.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - MobileHotspotToggle (ToggleSwitch)
- **Output elements:** MobileHotspotLabel, SsidRun, PasswordRun, BandRun, AuthenticationRun, StatusBorder, StatusBlock

