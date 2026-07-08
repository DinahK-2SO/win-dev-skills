# OCR C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - OCR image file

- **Screenshot:** `screenshots/01_OCR_image_file.png`
- **Page class:** `OcrFileImage`
- **UI elements:**
  - ToggleSwitch, name=UserLanguageToggle
  - Image, name=PreviewImage
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `OcrFileImage.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - UserLanguageToggle (ToggleSwitch)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - OCR captured image

- **Screenshot:** `screenshots/02_OCR_captured_image.png`
- **Page class:** `OcrCapturedImage`
- **UI elements:**
  - Image, name=PreviewImage
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `OcrCapturedImage.xaml.cs`)_
- **Output elements:** StatusBlock, StatusBorder

