# BasicSuspension — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - BasicSuspension

- **Screenshot:** `screenshots/01_BasicSuspension.png`
- **Page class:** `MainPage`
- **UI elements:**
  - ListView, name=list, label="Click on an item or click a button in the AppBar."
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `MainPage.xaml.cs`)_

