# Unicode tokenization C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Tokenize lexical identifiers within a string

- **Screenshot:** `screenshots/01_Tokenize_lexical_identifiers_within_a_string.png`
- **Page class:** `Scenario1_FindId`
- **UI elements:**
  - TextBox, name=TextInput, label="Hello, how are you?  I hope you are ok!&#10;--&gt;id&lt;--&#10;1id 2id 3id&#10;id1 id2 id3&#10;𠀀_CJK_B_1 𠀁_CJK_B_2 𠀂_CJK_B_3"
  - Button, label="Extract Identifiers"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_FindId.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Extract Identifiers "Extract Identifiers" (Button)
- **Output elements:** TextInput, TextOutput, StatusBorder, StatusBlock

