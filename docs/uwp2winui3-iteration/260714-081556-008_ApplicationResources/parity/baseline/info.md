# ApplicationResources — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - ApplicationResources

- **Screenshot:** `screenshots/01_ApplicationResources.png`
- **Page class:** `MainPage`
- **UI elements:**
  - ListBox, name=ScenarioControl
  - HyperlinkButton, label="Trademarks"
  - HyperlinkButton, name=PrivacyLink, label="Privacy"
  - Image, name=WindowsLogo
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `MainPage.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Trademarks "Trademarks" (HyperlinkButton)
  - Privacy "Privacy" (HyperlinkButton)
- **Output elements:** SampleTitle, Copyright, StatusLabel, StatusBlock, Header, StatusBorder

