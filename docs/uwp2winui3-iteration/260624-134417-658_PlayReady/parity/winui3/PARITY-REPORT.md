# Parity Report — PlayReady C# Sample

Generated 2026-07-09T00:17:39.9409241+08:00 by Compare-Parity.ps1.

**Parity score: 62.5 / 100**  ·  pass=1 partial=3 fail=0  ·  4 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Reactive License Request | PARTIAL | 2/3 | — | 01_Reactive_License_Request.png | Missing 1/3 control(s): TextBox "{Binding MoviePath, Mode=TwoWay}" |
| 2 | Proactive License Request | PARTIAL | 3/5 | — | 02_Proactive_License_Request.png | Missing 2/5 control(s): TextBox "{Binding KeyId, Mode=TwoWay}"; TextBox "{Binding MoviePath, Mode=TwoWay}" |
| 3 | Manage HW/SW DRM | PASS | 4/5 | — | 03_Manage_HW_SW_DRM.png | Missing 1/5 control(s): TextBox "{Binding MoviePath, Mode=TwoWay}" |
| 4 | Secure Stop | PARTIAL | 2/5 | — | 04_Secure_Stop.png | Missing 3/5 control(s): Button "Get Publisher Cert"; Button "Renew License"; TextBox "{Binding MoviePath, Mode=TwoWay}" |

## Scenarios needing work

### Scenario 1 — Reactive License Request  [PARTIAL]

- Missing 1/3 control(s): TextBox "{Binding MoviePath, Mode=TwoWay}"
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "{Binding MoviePath, Mode=TwoWay}"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Reactive_License_Request.png` against the baseline.

### Scenario 2 — Proactive License Request  [PARTIAL]

- Missing 2/5 control(s): TextBox "{Binding KeyId, Mode=TwoWay}"; TextBox "{Binding MoviePath, Mode=TwoWay}"
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "{Binding KeyId, Mode=TwoWay}"
  - TextBox "{Binding MoviePath, Mode=TwoWay}"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Proactive_License_Request.png` against the baseline.

### Scenario 4 — Secure Stop  [PARTIAL]

- Missing 3/5 control(s): Button "Get Publisher Cert"; Button "Renew License"; TextBox "{Binding MoviePath, Mode=TwoWay}"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Get Publisher Cert"
  - Button "Renew License"
  - TextBox "{Binding MoviePath, Mode=TwoWay}"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/04_Secure_Stop.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
