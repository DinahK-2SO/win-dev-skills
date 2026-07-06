# Parity Report — Lamp device C# sample

Generated 2026-07-07T07:26:52.0087579+08:00 by Compare-Parity.ps1.

**Parity score: 83.3 / 100**  ·  pass=2 partial=1 fail=0  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Get Lamp Instance | PASS | 3/3 | 2/2 live | 01_Get_Lamp_Instance.png |  |
| 2 | Enable Lamp and Settings Adjustment | PASS | 3/3 | 2/2 live | 02_Enable_Lamp_and_Settings_Adjustment.png |  |
| 3 | Lamp Device Change Events | PARTIAL | 3/4 | 1/3 live | 03_Lamp_Device_Change_Events.png | Missing 1/4 control(s): ToggleSwitch "Lamp On" |

## Scenarios needing work

### Scenario 3 — Lamp Device Change Events  [PARTIAL]

- Missing 1/4 control(s): ToggleSwitch "Lamp On"
- Controls not found in the WinUI 3 UIA tree:
  - ToggleSwitch "Lamp On"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Lamp_Device_Change_Events.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
