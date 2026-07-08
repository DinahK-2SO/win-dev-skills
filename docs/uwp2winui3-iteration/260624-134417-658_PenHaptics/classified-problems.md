# Classified problems

## skill-defect (WILL change skill) — `skill-defects.json`
- **InkCanvas scenario dropped from nav.** `Initialize-UwpMigration.ps1` collapses *any*
  file with an unsupported hit to `defer` (§1), including a page whose only blocker is a
  hero UI control with a placeholder path. Deferred pages are then omitted from nav → whole
  scenario lost → parity FAIL. Fix: tag placeholder-capable controls in the inventory and
  keep such files as `migrate-with-adaptation` (placeholder TODO) instead of `defer`.

## skill-coverage-gap (WILL change skill) — `skill-coverage-gaps.json`
- **Contradictory nav guidance.** SKILL.md invariant #4 ("deferred items omitted from nav")
  vs the placeholder guidance ("keep the page with a placeholder"). Sharpen the tie-break:
  only omit a scenario with NO representable UI; keep a scenario whose only blocker is an
  unsupported hero control, with a placeholder.

## dev-agent-slip (NO skill change) — `dev-agent-slips.json`
- **Scenario 4 Compare-Parity FAIL** = eval-tool title-ambiguity artifact; scorer confirmed
  PASS. Belongs to the evaluation instrument, not the migration skill. Out of scope.
