# Parity Report — Camera resolution C# sample

Generated 2026-07-16T19:49:01.8435950+00:00 by Compare-Parity.ps1.

**Parity score: 83.3 / 100**  ·  pass=2 partial=1 fail=0  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Change camera preview settings | PASS | 2/2 | 1/1 live | 01_Change_camera_preview_settings.png |  |
| 2 | Change preview and photo settings | PASS | 3/3 | 1/1 live | 02_Change_preview_and_photo_settings.png |  |
| 3 | Match aspect ratios | PARTIAL | 2/3 | 1/1 live | 03_Match_aspect_ratios.png | Missing 1/3 control(s): ComboBox "Video Settings" |

## Scenarios needing work

### Scenario 3 — Match aspect ratios  [PARTIAL]

- Missing 1/3 control(s): ComboBox "Video Settings"
- Controls not found in the WinUI 3 UIA tree:
  - ComboBox "Video Settings"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Match_aspect_ratios.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
