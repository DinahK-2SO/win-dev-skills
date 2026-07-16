# Parity Report — CameraProfile

Generated 2026-07-16T18:53:42.7045996+00:00 by Compare-Parity.ps1.

**Parity score: 100 / 100**  ·  pass=3 partial=0 fail=0  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Locate Record Specific Profile | PASS | 3/3 | 2/2 live | 01_Locate_Record_Specific_Profile.png |  |
| 2 | Query Profile for Concurrency | PASS | 2/2 | 1/1 live | 02_Query_Profile_for_Concurrency.png |  |
| 3 | Query Profile for HDR Support | PASS | 2/2 | 0/1 live | 03_Query_Profile_for_HDR_Support.png |  |

All scenarios reached `pass`. ✔

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
