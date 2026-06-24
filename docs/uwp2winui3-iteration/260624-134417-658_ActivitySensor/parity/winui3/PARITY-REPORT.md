# Parity Report — Activity sensor

Generated 2026-06-24T23:01:29.9980236+08:00 by Compare-Parity.ps1.

**Parity score: 100 / 100**  ·  pass=4 partial=0 fail=0  ·  4 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Current activity | PASS | 1/1 | 1/1 live | 01_Current_activity.png |  |
| 2 | Activity history | PASS | 1/1 | 1/1 live | 02_Activity_history.png |  |
| 3 | Events | PASS | 2/2 | 1/2 live | 03_Events.png |  |
| 4 | Background activity | PASS | 2/2 | 0/2 live | 04_Background_activity.png |  |

All scenarios reached `pass`. ✔

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
