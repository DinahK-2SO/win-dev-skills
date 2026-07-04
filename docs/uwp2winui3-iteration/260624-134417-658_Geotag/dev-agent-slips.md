# Dev-agent slips / non-skill items — Geotag

## 1. Coverage 1/4 in initial capture (NOT a defect, NOT a skill change)
- The three extra buttons are **file-gated in both** the UWP original and the WinUI port —
  they appear only after a file is chosen. The migration faithfully reproduced this.
- Evidence: score `discrepancies.json` id `coverage-1-of-4` (info,
  structural-capture-limitation).
- This is an evaluation capture limitation, not a migration or dev-agent problem. No
  migration-skill edit applies; the eval capture is out of scope.
