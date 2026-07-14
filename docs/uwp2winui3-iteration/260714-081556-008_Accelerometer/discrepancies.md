# Discrepancies — Accelerometer (iteration 1)

**Score 100 · builds ✅ · runs ✅ · parity 6/6 (100% coverage, 0 behavioral regressions).**

All six scenarios reproduce the UWP layout, controls, descriptions, output placeholders,
and the red "Standard accelerometer not found" status band faithfully.

| # | Requirement | Status |
|---|-------------|--------|
| 0 | Choose accelerometer | pass |
| 1 | Data events | pass |
| 2 | Shake events | pass |
| 3 | Polling | pass |
| 4 | Orientation change | pass |
| 5 | Data events batching | pass |

## Visual discrepancies (cosmetic only, expected)
- Header: "Universal Windows Platform sample" → "Windows App SDK Sample" (expected branding).
- Footer: Microsoft logo image dropped, copyright text retained (minor sample chrome).

## Note
No skill-attributable parity gaps exist. The improvement opportunities come from
**build-log frictions** that recur corpus-wide (nullable DTO warnings, DEFERRED.md
validator sentinel mismatch) — see skill-defects / skill-coverage-gaps notes.
