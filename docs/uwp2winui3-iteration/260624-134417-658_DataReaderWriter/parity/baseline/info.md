# DataReader/Writer Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Read and write simple structured data.

- **Screenshot:** `screenshots/01_Read_and_write_simple_structured_data.png`
- **Page class:** `WriteReadStream`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `WriteReadStream.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Dump file contents using ReadBytes().

- **Screenshot:** `screenshots/02_Dump_file_contents_using_ReadBytes.png`
- **Page class:** `ReadBytes`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `ReadBytes.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

