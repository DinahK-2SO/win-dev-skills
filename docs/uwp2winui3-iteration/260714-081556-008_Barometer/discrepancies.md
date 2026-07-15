# Barometer — Parity Discrepancies

Score **100/100**, both scenarios **pass**, builds & runs.

- **Req 1 Data Events — pass.** Enable + Disable present, visuals match golden.
- **Req 2 Polling — pass.** Get Data present, reachable, status correct.

**Visual nuance (non-scoring):** WinUI disables Enable/Disable when no sensor is present; UWP leaves Enable clickable (but clicking only re-shows 'No barometer found'). Net outcome identical — benign defensive-UI choice, no dropped/dead control.

No missing features. All real friction was build-time, not user-visible.
