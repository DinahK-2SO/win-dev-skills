# Parity Report — Accelerometer C# Sample

Generated 2026-07-14T00:34:30.0345935+00:00 by Compare-Parity.ps1.

**Parity score: 100 / 100**  ·  pass=6 partial=0 fail=0  ·  6 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Choose accelerometer | PASS | 1/1 | — | 01_Choose_accelerometer.png |  |
| 2 | Data events | PASS | 2/2 | 0/2 live | 02_Data_events.png |  |
| 3 | Shake events | PASS | 2/2 | 0/2 live | 03_Shake_events.png |  |
| 4 | Polling | PASS | 2/2 | 0/2 live | 04_Polling.png |  |
| 5 | Orientation change | PASS | 2/2 | 0/2 live | 05_Orientation_change.png |  |
| 6 | Data events batching | PASS | 2/2 | 0/2 live | 06_Data_events_batching.png |  |

All scenarios reached `pass`. ✔

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
