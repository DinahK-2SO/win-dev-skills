# Printing C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Basic

- **Screenshot:** `screenshots/01_Basic.png`
- **Page class:** `Scenario1Basic`
- **UI elements:**
  - Button, name=InvokePrintingButton, label="Print", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1Basic.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Print "Print" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 2 - Standard Options

- **Screenshot:** `screenshots/02_Standard_Options.png`
- **Page class:** `Scenario2StandardOptions`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2StandardOptions.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Custom Options

- **Screenshot:** `screenshots/03_Custom_Options.png`
- **Page class:** `Scenario3CustomOptions`
- **UI elements:**
  - Button, name=InvokePrintingButton, label="Print", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3CustomOptions.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Print "Print" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 4 - Page Range

- **Screenshot:** `screenshots/04_Page_Range.png`
- **Page class:** `Scenario4PageRange`
- **UI elements:**
  - Button, name=InvokePrintingButton, label="Print", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4PageRange.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Print "Print" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 5 - Photos

- **Screenshot:** `screenshots/05_Photos.png`
- **Page class:** `Scenario5Photos`
- **UI elements:**
  - Button, name=InvokePrintingButton, label="Print", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5Photos.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Print "Print" (Button)
- **Output elements:** StatusBlock, StatusBorder

## Scenario 6 - Disable Preview

- **Screenshot:** `screenshots/06_Disable_Preview.png`
- **Page class:** `Scenario6DisablePreview`
- **UI elements:**
  - Button, name=InvokePrintingButton, label="Print", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6DisablePreview.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Print "Print" (Button)
- **Output elements:** StatusBlock, StatusBorder

