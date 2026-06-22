# Parity Report — ScreenCasting

Generated 2026-06-23T06:01:22.5433336+08:00 by Compare-Parity.ps1.

**Parity score: 0 / 100**  ·  pass=0 partial=0 fail=1  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | DIAL Receiver Windows Universal Application | FAIL | n/a | — | 01_DIAL_Receiver_Windows_Universal_Application.png | Scenario not reachable — no screenshot/UIA captured. |

## Scenarios needing work

### Scenario 1 — DIAL Receiver Windows Universal Application  [FAIL]

- Scenario not reachable — no screenshot/UIA captured.
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_DIAL_Receiver_Windows_Universal_Application.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
