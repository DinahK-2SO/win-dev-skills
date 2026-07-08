# Dev-agent slips — PowerGrid (will NOT change skill)

## 1. Wrong path on first Validate-UwpMigration.ps1 call
- **Evidence:** session-log.txt L3700-3715 — first path `<Target>\.github\skills\...` not found; retry at `<app>\.github\skills\...` returned PASS (L3717-3734).
- **Covered clearly at:** SKILL.md Step 4 L148-150 uses `<skill-root>/scripts/Validate-UwpMigration.ps1 -Target <winui3-project-root>` — `<skill-root>` is explicitly distinct from `-Target`, used uniformly for all scripts.
- **Slip type:** one-off mistake, self-corrected in one turn.
- **Why no skill change:** the skill already distinguishes skill-root from target consistently; a re-run fixes this without an edit. Hard-coding a path would be scenario-specific.
