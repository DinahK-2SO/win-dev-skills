# TouchKeyboardTextInput — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Spelling and Text Suggestions

- **Screenshot:** `screenshots/01_Spelling_and_Text_Suggestions.png`
- **Page class:** `Scenario1_SpellingTextSuggestions`
- **UI elements:**
  - TextBox, name=TextBoxOff
  - RichEditBox, name=RichEditOff
  - TextBox, name=TextBoxOn
  - RichEditBox, name=RichEditOn
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_SpellingTextSuggestions.xaml.cs`)_
- **Output elements:** TextBoxOff, TextBoxOn, OutputTextBlock1, StatusBorder, StatusBlock

## Scenario 2 - Scoped Views

- **Screenshot:** `screenshots/02_Scoped_Views.png`
- **Page class:** `Scenario2_ScopedViews`
- **UI elements:**
  - TextBox, name=NumberControl
  - TextBox, name=SearchControl
  - TextBox, name=UrlControl
  - TextBox, name=EmailControl
  - TextBox, name=DefaultControl
  - TextBox, name=TelephoneControl
  - TextBox, name=FormulaControl
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ScopedViews.xaml.cs`)_
- **Output elements:** NumberControl, SearchControl, UrlControl, EmailControl, DefaultControl, TelephoneControl, FormulaControl, StatusBorder, StatusBlock

