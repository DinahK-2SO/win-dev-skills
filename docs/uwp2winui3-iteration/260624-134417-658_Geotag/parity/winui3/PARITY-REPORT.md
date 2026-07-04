# Parity Report — Geotag C# Sample

Generated 2026-07-04T12:40:49.8219460+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=1  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Geotag a file | FAIL | 1/4 | 1/4 live | 01_Geotag_a_file.png | Missing 3/4 control(s): Button "Read geotag from file"; Button "Set geotag from geolocator"; Button "Set geotag to Seattle Space Needle" |

## Scenarios needing work

### Scenario 1 — Geotag a file  [FAIL]

- Missing 3/4 control(s): Button "Read geotag from file"; Button "Set geotag from geolocator"; Button "Set geotag to Seattle Space Needle"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Read geotag from file"
  - Button "Set geotag from geolocator"
  - Button "Set geotag to Seattle Space Needle"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Geotag_a_file.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
