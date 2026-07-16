# Parity Report — Camera Frames

Generated 2026-07-16T15:58:22.3390876+00:00 by Compare-Parity.ps1.

**Parity score: 75 / 100**  ·  pass=1 partial=1 fail=0  ·  2 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Shared mode access to color, depth and infrared frame sources | PASS | 1/1 | 1/1 live | 01_Shared_mode_access_to_color_depth_and_infrared_frame_sources.png |  |
| 2 | Find and display all media frame sources | PARTIAL | 2/5 | 0/2 live | 02_Find_and_display_all_media_frame_sources.png | Missing 3/5 control(s): ComboBox "Select ..."; ComboBox "Select ..."; ComboBox "Default format" |

## Scenarios needing work

### Scenario 2 — Find and display all media frame sources  [PARTIAL]

- Missing 3/5 control(s): ComboBox "Select ..."; ComboBox "Select ..."; ComboBox "Default format"
- Controls not found in the WinUI 3 UIA tree:
  - ComboBox "Select ..."
  - ComboBox "Select ..."
  - ComboBox "Default format"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Find_and_display_all_media_frame_sources.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
