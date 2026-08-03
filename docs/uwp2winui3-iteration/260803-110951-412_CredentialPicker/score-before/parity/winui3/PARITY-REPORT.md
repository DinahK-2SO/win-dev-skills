# Parity Report — CredentialPicker

Generated 2026-08-03T07:46:17.0722295+00:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=3  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Message | FAIL | 1/9 | 0/1 live | 01_Message.png | Missing 8/9 control(s): TextBox "contoso.com"; Button "Launch"; TextBox (Domain); TextBox (Username); TextBox (Password); TextBox (CredentialSaved); TextBox (CheckboxState); TextBox (Status) |
| 2 | Message+Caption | FAIL | 2/10 | 0/1 live | 02_Message_Caption.png | Missing 8/10 control(s): TextBox "contoso.com"; Button "Launch"; TextBox (Domain); TextBox (Username); TextBox (Password); TextBox (CredentialSaved); TextBox (CheckboxState); TextBox (Status) |
| 3 | CredentialPickerOptions | FAIL | 2/14 | 0/1 live | 03_CredentialPickerOptions.png | Missing 12/14 control(s): TextBox "contoso.com"; ComboBox (SaveCheckboxSelection); ComboBox (ProtocolSelection); TextBox "CustomProtocolName"; CheckBox (AlwaysShowDialog); Button "Launch"; TextBox (Domain); TextBox (Username) |

## Scenarios needing work

### Scenario 1 — Message  [FAIL]

- Missing 8/9 control(s): TextBox "contoso.com"; Button "Launch"; TextBox (Domain); TextBox (Username); TextBox (Password); TextBox (CredentialSaved); TextBox (CheckboxState); TextBox (Status)
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "contoso.com"
  - Button "Launch"
  - TextBox (Domain)
  - TextBox (Username)
  - TextBox (Password)
  - TextBox (CredentialSaved)
  - TextBox (CheckboxState)
  - TextBox (Status)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Message.png` against the baseline.

### Scenario 2 — Message+Caption  [FAIL]

- Missing 8/10 control(s): TextBox "contoso.com"; Button "Launch"; TextBox (Domain); TextBox (Username); TextBox (Password); TextBox (CredentialSaved); TextBox (CheckboxState); TextBox (Status)
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "contoso.com"
  - Button "Launch"
  - TextBox (Domain)
  - TextBox (Username)
  - TextBox (Password)
  - TextBox (CredentialSaved)
  - TextBox (CheckboxState)
  - TextBox (Status)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Message_Caption.png` against the baseline.

### Scenario 3 — CredentialPickerOptions  [FAIL]

- Missing 12/14 control(s): TextBox "contoso.com"; ComboBox (SaveCheckboxSelection); ComboBox (ProtocolSelection); TextBox "CustomProtocolName"; CheckBox (AlwaysShowDialog); Button "Launch"; TextBox (Domain); TextBox (Username)
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "contoso.com"
  - ComboBox (SaveCheckboxSelection)
  - ComboBox (ProtocolSelection)
  - TextBox "CustomProtocolName"
  - CheckBox (AlwaysShowDialog)
  - Button "Launch"
  - TextBox (Domain)
  - TextBox (Username)
  - TextBox (Password)
  - TextBox (CredentialSaved)
  - TextBox (CheckboxState)
  - TextBox (Status)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_CredentialPickerOptions.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
