# Discrepancies — LightSensor (index 0)

- **Score:** 100/100 · builds ✅ · runs ✅
- **Requirements:** both `pass` (Data Events, Polling). Full control coverage, identical
  output text vs UWP golden.
- **Visual discrepancies:** none with evidence (WinUI pixel capture unavailable — swapchain
  limitation; fidelity confirmed via live UIA tree).
- **Missing features:** none.

No parity gap to fix. The only actionable signal is **build-time churn** during the
migration (CS0103 `App`, WMC0909 `x:DataType local:Scenario`) — see `skill-coverage-gaps`.
