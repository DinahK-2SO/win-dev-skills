# Parity Report — x:DeferLoadStrategy

Generated 2026-08-07T23:56:56.4203142+00:00 by Compare-Parity.ps1.

**Parity score: 66.7 / 100**  ·  pass=2 partial=0 fail=1  ·  3 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Basic Deferral | PASS | 1/1 | 0/1 live | 01_Basic_Deferral.png |  |
| 2 | Adaptive Deferral | FAIL | 0/4 | 0/1 live | 02_Adaptive_Deferral.png | Missing 4/4 control(s): ListView (AccountsList); ListView (MailList); Button (Send); RichEditBox (Body) |
| 3 | Control Template Deferral | PASS | n/a | — | 03_Control_Template_Deferral.png |  |

## Scenarios needing work

### Scenario 2 — Adaptive Deferral  [FAIL]

- Missing 4/4 control(s): ListView (AccountsList); ListView (MailList); Button (Send); RichEditBox (Body)
- Controls not found in the WinUI 3 UIA tree:
  - ListView (AccountsList)
  - ListView (MailList)
  - Button (Send)
  - RichEditBox (Body)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Adaptive_Deferral.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
