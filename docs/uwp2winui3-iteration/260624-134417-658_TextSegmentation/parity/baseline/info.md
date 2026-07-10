# Text segmentation C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Extract Text Segments

- **Screenshot:** `screenshots/01_Extract_Text_Segments.png`
- **Page class:** `Scenario1_ExtractTextSegments`
- **UI elements:**
  - TextBox, name=inputStringBox
  - TextBox, name=languageTagBox
  - Button, name=WordSegmentsButton, label="Word Segments"
  - Button, name=SelectionSegmentsButton, label="Selection Segments"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_ExtractTextSegments.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Word Segments "Word Segments" (Button)
  - Selection Segments "Selection Segments" (Button)
- **Output elements:** inputStringBox, languageTagBox, StatusBorder, StatusBlock

## Scenario 2 - Get Current Text Segment From Index

- **Screenshot:** `screenshots/02_Get_Current_Text_Segment_From_Index.png`
- **Page class:** `Scenario2_GetCurrentTextSegmentFromIndex`
- **UI elements:**
  - TextBox, name=inputStringBox
  - TextBox, name=languageTagBox
  - TextBox, name=indexBox
  - Button, name=WordSegmentButton, label="Word Segment"
  - Button, name=SelectionSegmentButton, label="Selection Segment"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_GetCurrentTextSegmentFromIndex.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Word Segment "Word Segment" (Button)
  - Selection Segment "Selection Segment" (Button)
- **Output elements:** inputStringBox, languageTagBox, indexBox, StatusBorder, StatusBlock

