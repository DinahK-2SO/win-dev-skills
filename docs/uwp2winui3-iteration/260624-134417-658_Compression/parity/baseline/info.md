# Compression — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Compression/Decompression sample

- **Screenshot:** `screenshots/01_Compression_Decompression_sample.png`
- **Page class:** `Scenario1`
- **UI elements:**
  - ComboBox, name=CompressAlgorithmComboBox, events=SelectionChanged
  - Button, name=CompressFileButton, label="Compress File...", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Compress File... "Compress File..." (Button)
- **Output elements:** DefaultTextBlock, XpressTextBlock, XpressHuffTextBlock, MszipTextBlock, LzmsTextBlock, Progress, StatusBorder, StatusBlock

