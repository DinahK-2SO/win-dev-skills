# Parity Report — ApplicationResources

Generated 2026-07-13T20:37:19.4937664+00:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=1  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | ApplicationResources | FAIL | 1/4 | 0/2 live | 01_ApplicationResources.png | Missing 3/4 control(s): ListBox (ScenarioControl); HyperlinkButton "Trademarks"; HyperlinkButton "Privacy" |

## Scenarios needing work

### Scenario 1 — ApplicationResources  [FAIL]

- Missing 3/4 control(s): ListBox (ScenarioControl); HyperlinkButton "Trademarks"; HyperlinkButton "Privacy"
- Controls not found in the WinUI 3 UIA tree:
  - ListBox (ScenarioControl)
  - HyperlinkButton "Trademarks"
  - HyperlinkButton "Privacy"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_ApplicationResources.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
