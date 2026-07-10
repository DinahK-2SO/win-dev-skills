# Parity Rubric - TextSegmentation

Feature: **Text segmentation C# sample** (2 scenarios). Derived from the UWP source and
used to grade the migrated WinUI 3 app. Each scenario passes when every baseline control
is present in the UIA tree and each action control responds as the UWP handler does.

## Scenario 1 - Extract Text Segments
- Controls: inputStringBox, languageTagBox, WordSegmentsButton, SelectionSegmentsButton
- Actions: Word Segments, Selection Segments -> write segment bounds to the status area
- Empty input -> "Cannot compute word/selection segments: input string is empty."

## Scenario 2 - Get Current Text Segment From Index
- Controls: inputStringBox, languageTagBox, indexBox, WordSegmentButton, SelectionSegmentButton
- Actions: Word Segment, Selection Segment -> write the segment containing the index
- Empty input -> empty-input status message
