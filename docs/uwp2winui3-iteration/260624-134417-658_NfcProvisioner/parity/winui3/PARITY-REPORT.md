# Parity Report — NfcProvisioner

Generated 2026-07-08T00:57:07.1856126+08:00 by Compare-Parity.ps1.

**Parity score: 50 / 100**  ·  pass=0 partial=1 fail=0  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Provision Peer Device | PARTIAL | 2/3 | 1/3 live | 01_Provision_Peer_Device.png | Missing 1/3 control(s): Button "Cancel Transfer" |

## Scenarios needing work

### Scenario 1 — Provision Peer Device  [PARTIAL]

- Missing 1/3 control(s): Button "Cancel Transfer"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Cancel Transfer"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Provision_Peer_Device.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
