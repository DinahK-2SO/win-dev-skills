# Dev-agent-slips — AssociationLaunching (will NOT change skill)

## 1. Status=copied rows on first validator run
- **Evidence:** session-log L3039-3045 FAIL, L3070-3082 PASS after fixing.
- **Covered clearly at:** SKILL.md Step 1 (flip `Status` copied→done) and Step 4 common-fixes.
- **Why no change:** Prominently documented twice; validator caught and named the fix; the
  self-correcting loop worked. One-off slip.

## 2. Benign CA1416 / CS0414 warnings
- **Evidence:** build-output.txt L8, L11-13.
- **Why no change:** Scenario-specific, non-blocking; behavior verified live. Not a
  recurring migration pattern.
