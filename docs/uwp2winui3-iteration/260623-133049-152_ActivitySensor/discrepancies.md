# Parity discrepancies — ActivitySensor

**Score 100/100 · builds ✔ · runs ✔ · 4/4 PASS · no discrepancies.**

| # | Feature | Status | Reason |
|---|---------|--------|--------|
| 1 | Current activity | pass | 1/1 control; invoked OK |
| 2 | Activity history | pass | 1/1 control; invoked OK |
| 3 | Events (On/Off) | pass | 2/2; Off correctly state-gated |
| 4 | Background activity | pass | 2/2; Unregister correctly state-gated |

No visual or missing-feature discrepancies. Blank WinUI screenshots + absent UWP
behavioral baseline are headless-capture limitations (eval side), not migration defects.
