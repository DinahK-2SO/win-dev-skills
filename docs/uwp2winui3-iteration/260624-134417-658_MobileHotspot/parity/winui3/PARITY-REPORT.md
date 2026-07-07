# Parity Report — MobileHotspot C# Sample

Generated 2026-07-07T23:08:39.4675897+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=2  ·  2 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Configure Mobile Hotspot | FAIL | 0/6 | 0/2 live | 01_Configure_Mobile_Hotspot.png | Missing 6/6 control(s): TextBox (SsidTextBox); TextBox (PassphraseTextBox); ComboBox (BandComboBox); ComboBox (AuthenticationComboBox); Button "Apply changes"; Button "Discard changes" |
| 2 | Toggle Mobile Hotspot | FAIL | 0/1 | 0/1 live | 02_Toggle_Mobile_Hotspot.png | Missing 1/1 control(s): ToggleSwitch (MobileHotspotToggle) |

## Scenarios needing work

### Scenario 1 — Configure Mobile Hotspot  [FAIL]

- Missing 6/6 control(s): TextBox (SsidTextBox); TextBox (PassphraseTextBox); ComboBox (BandComboBox); ComboBox (AuthenticationComboBox); Button "Apply changes"; Button "Discard changes"
- Controls not found in the WinUI 3 UIA tree:
  - TextBox (SsidTextBox)
  - TextBox (PassphraseTextBox)
  - ComboBox (BandComboBox)
  - ComboBox (AuthenticationComboBox)
  - Button "Apply changes"
  - Button "Discard changes"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Configure_Mobile_Hotspot.png` against the baseline.

### Scenario 2 — Toggle Mobile Hotspot  [FAIL]

- Missing 1/1 control(s): ToggleSwitch (MobileHotspotToggle)
- Controls not found in the WinUI 3 UIA tree:
  - ToggleSwitch (MobileHotspotToggle)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Toggle_Mobile_Hotspot.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
