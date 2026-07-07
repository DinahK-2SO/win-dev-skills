# Linguistic services C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Language Detection

- **Screenshot:** `screenshots/01_Language_Detection.png`
- **Page class:** `Scenario1_LanguageDetection`
- **UI elements:**
  - TextBox, name=TextInput
  - Button, name=Go, label="Detect Languages"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_LanguageDetection.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Detect Languages "Detect Languages" (Button)
- **Output elements:** TextInput, TextOutput, StatusBorder, StatusBlock

## Scenario 2 - Script Detection

- **Screenshot:** `screenshots/02_Script_Detection.png`
- **Page class:** `Scenario2_ScriptDetection`
- **UI elements:**
  - TextBox, name=TextInput
  - Button, name=Go, label="Detect Scripts"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ScriptDetection.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Detect Scripts "Detect Scripts" (Button)
- **Output elements:** TextInput, TextOutput, StatusBorder, StatusBlock

## Scenario 3 - Transliteration

- **Screenshot:** `screenshots/03_Transliteration.png`
- **Page class:** `Scenario3_Transliteration`
- **UI elements:**
  - TextBox, name=TextInput
  - Button, name=Go, label="Transliterate"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_Transliteration.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Transliterate "Transliterate" (Button)
- **Output elements:** TextInput, TextOutput, StatusBorder, StatusBlock

## Scenario 4 - Character Grouping

- **Screenshot:** `screenshots/04_Character_Grouping.png`
- **Page class:** `Scenario4_CharacterGrouping`
- **UI elements:**
  - ComboBox, name=LanguageText
  - Button, label="Get groups"
  - ComboBox, name=CandidateText
  - Button, label="Assign group"
  - GridView, name=GroupingsGrid
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_CharacterGrouping.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get groups "Get groups" (Button)
  - Assign group "Assign group" (Button)
- **Output elements:** GroupingResult, StatusBorder, StatusBlock

