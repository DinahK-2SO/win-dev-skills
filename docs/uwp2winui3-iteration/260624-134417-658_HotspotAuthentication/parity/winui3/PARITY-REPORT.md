# Parity Report — Hotspot Authentication

Generated 2026-07-07T02:42:02.3148177+08:00 by Compare-Parity.ps1.

**Parity score: 100 / 100**  ·  pass=3 partial=0 fail=0  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Initialization | PASS | 3/3 | 1/3 live | 01_Initialization.png |  |
| 2 | Authentication by background task | PASS | n/a | — | 02_Authentication_by_background_task.png |  |
| 3 | Authentication by foreground app | PASS | 3/3 | 0/3 live | 03_Authentication_by_foreground_app.png |  |

All scenarios reached `pass`. ✔

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
