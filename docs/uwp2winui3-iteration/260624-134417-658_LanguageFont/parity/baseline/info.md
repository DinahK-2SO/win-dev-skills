# Language Font CS Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Fonts for UI

- **Screenshot:** `screenshots/01_Fonts_for_UI.png`
- **Page class:** `Scenario1_UIFonts`
- **UI elements:**
  - Button, label="Apply Recommended Fonts"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_UIFonts.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Apply Recommended Fonts "Apply Recommended Fonts" (Button)
- **Output elements:** HeadingTextBlock, BodyTextBlock, StatusBorder, StatusBlock

## Scenario 2 - Fonts for Documents

- **Screenshot:** `screenshots/02_Fonts_for_Documents.png`
- **Page class:** `Scenario2_DocumentFonts`
- **UI elements:**
  - Button, label="Apply Recommended Fonts"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_DocumentFonts.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Apply Recommended Fonts "Apply Recommended Fonts" (Button)
- **Output elements:** HeadingTextBlock, DocumentTextBlock, StatusBorder, StatusBlock

