# Parity discrepancies — Altimeter

**Score 100/100, builds + runs.** No parity defects.

| # | Feature | Status | Notes |
|---|---------|--------|-------|
| 1 | Data Events | pass | Enable/Disable buttons + AutomationIds match; 'No data' / 'No altimeter found' match UWP. |
| 2 | Polling | pass | Get Data button (disabled, no device); default text matches UWP. |

No visual or missing-feature discrepancies. Both apps hardware-gated (no altimeter on host).
The improvement evidence lives in the migration build log, not the parity result.
