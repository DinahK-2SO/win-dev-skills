# Skill Coverage Gaps → WILL change skill (sharpen existing content)

## 1. Render-verification covers scenario frames but not persistent shell chrome
- **Problem:** Verification guidance says "navigate each scenario and confirm the content
  frame renders" — it never mentions the persistent shell chrome (Status/NotifyUser area,
  title/header, footer). The missing Status area is shell-level, so a per-frame check
  structurally cannot catch it.
- **Covered at:** `MIGRATION-PATTERNS.md#silent-navigation-failures` step 2; `SKILL.md`
  Step 3 blockquote.
- **Why missed:** under-emphasized (scope of the check is narrower than the failure class).
- **Improvement:** Widen the existing wording to include "the persistent shell chrome that
  lives outside the frame — especially the SDK-sample Status/NotifyUser area (StatusBlock),
  the title/header, and the footer." Add a one-line pointer to the new Status-area layout
  pattern.
- **Generalizes:** Every migrated multi-page shell has persistent chrome a per-frame check
  ignores; widening protects the whole SDK-sample family.
