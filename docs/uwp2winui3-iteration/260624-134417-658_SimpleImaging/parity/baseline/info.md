# Simple imaging C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Image properties (FileProperties)

- **Screenshot:** `screenshots/01_Image_properties_FileProperties.png`
- **Page class:** `Scenario1`
- **UI elements:**
  - Button, name=OpenButton, label="Open", events=Click
  - Button, name=ApplyButton, label="Save", events=Click
  - Button, name=CloseButton, label="Close", events=Click
  - Image, name=PreviewImage
  - TextBox, name=TitleTextbox
  - TextBox, name=KeywordsTextbox
  - TextBox, name=LatDegTextbox
  - TextBox, name=LatMinTextbox
  - TextBox, name=LatSecTextbox
  - TextBox, name=LatRefTextbox
  - TextBox, name=LongDegTextbox
  - TextBox, name=LongMinTextbox
  - TextBox, name=LongSecTextbox
  - TextBox, name=LongRefTextbox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Open "Open" (Button)
  - Save "Save" (Button)
  - Close "Close" (Button)
- **Output elements:** TitleTextbox, KeywordsTextbox, LatDegTextbox, LatMinTextbox, LatSecTextbox, LatRefTextbox, LongDegTextbox, LongMinTextbox, LongSecTextbox, LongRefTextbox, DateTakenTextblock, MakeTextblock, ModelTextblock, OrientationTextblock, ExposureTextblock, FNumberTextblock, StatusBorder, StatusBlock

## Scenario 2 - Image transforms/encode (BitmapDecoder)

- **Screenshot:** `screenshots/02_Image_transforms_encode_BitmapDecoder.png`
- **Page class:** `Scenario2`
- **UI elements:**
  - Button, name=OpenButton, label="Open", events=Click
  - Button, name=RotateLeftButton, label="Left 90°", events=Click
  - Button, name=RotateRightButton, label="Right 90°", events=Click
  - Button, name=SaveButton, label="Save", events=Click
  - Button, name=SaveAsButton, label="Save as", events=Click
  - Button, name=CloseButton, label="Close", events=Click
  - Image, name=PreviewImage
  - Slider, name=ScaleSlider, events=ValueChanged
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Open "Open" (Button)
  - Left 90° "Left 90°" (Button)
  - Right 90° "Right 90°" (Button)
  - Save "Save" (Button)
  - Save as "Save as" (Button)
  - Close "Close" (Button)
- **Output elements:** ScaleTextblock, WidthTextblock, HeightTextblock, UserRotationTextblock, ExifOrientationTextblock, StatusBorder, StatusBlock

