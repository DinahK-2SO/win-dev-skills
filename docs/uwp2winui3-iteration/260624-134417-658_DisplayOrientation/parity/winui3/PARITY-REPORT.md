# Parity Report — Display orientation

Generated 2026-07-03T07:03:45.3232164+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=1  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Show and lock orientation | FAIL | 0/5 | 0/1 live | 01_Show_and_lock_orientation.png | Missing 5/5 control(s): CheckBox "Prefer landscape"; CheckBox "Prefer portrait"; CheckBox "Prefer landscape flipped"; CheckBox "Prefer portrait flipped"; Button "Apply preferences" |

## Scenarios needing work

### Scenario 1 — Show and lock orientation  [FAIL]

- Missing 5/5 control(s): CheckBox "Prefer landscape"; CheckBox "Prefer portrait"; CheckBox "Prefer landscape flipped"; CheckBox "Prefer portrait flipped"; Button "Apply preferences"
- Controls not found in the WinUI 3 UIA tree:
  - CheckBox "Prefer landscape"
  - CheckBox "Prefer portrait"
  - CheckBox "Prefer landscape flipped"
  - CheckBox "Prefer portrait flipped"
  - Button "Apply preferences"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Show_and_lock_orientation.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
