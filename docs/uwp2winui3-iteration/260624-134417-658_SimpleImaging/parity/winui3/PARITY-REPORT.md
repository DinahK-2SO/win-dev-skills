# Parity Report — Simple imaging C# sample

Generated 2026-07-10T07:25:18.9762759+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=2  ·  2 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Image properties (FileProperties) | FAIL | 0/14 | 0/3 live | 01_Image_properties_FileProperties.png | Scenario not reachable — no screenshot/UIA captured. |
| 2 | Image transforms/encode (BitmapDecoder) | FAIL | 0/8 | 0/6 live | 02_Image_transforms_encode_BitmapDecoder.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 1 — Image properties (FileProperties)  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Open"
  - Button "Save"
  - Button "Close"
  - Image (PreviewImage)
  - TextBox (TitleTextbox)
  - TextBox (KeywordsTextbox)
  - TextBox (LatDegTextbox)
  - TextBox (LatMinTextbox)
  - TextBox (LatSecTextbox)
  - TextBox (LatRefTextbox)
  - TextBox (LongDegTextbox)
  - TextBox (LongMinTextbox)
  - TextBox (LongSecTextbox)
  - TextBox (LongRefTextbox)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Image_properties_FileProperties.png` against the baseline.

### Scenario 2 — Image transforms/encode (BitmapDecoder)  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Controls not found in the WinUI 3 UIA tree:
  - Button "Open"
  - Button "Left 90°"
  - Button "Right 90°"
  - Button "Save"
  - Button "Save as"
  - Button "Close"
  - Image (PreviewImage)
  - Slider (ScaleSlider)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Image_transforms_encode_BitmapDecoder.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
