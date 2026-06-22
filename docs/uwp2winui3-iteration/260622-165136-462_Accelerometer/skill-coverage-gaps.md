# Skill coverage gaps — Accelerometer (WILL change skill)

## 1. `Colors` namespace move (CS0103 / CS0234) — present but buried
- **Evidence:** session-log turns 44-47: `Colors` → `Windows.UI.Colors` → finally
  `Windows.UI.Color.FromArgb(...)` workaround. 2 build cycles lost.
- **Covered at:** MIGRATION-PATTERNS.md namespace table row `Windows.UI.Colors →
  Microsoft.UI.Colors` (line 77) — one row in a 13-row table, not in the prominent
  "Common build errors" section.
- **Why missed:** buried; doesn't show the *unqualified* `Colors.X` form, and omits the
  key gotcha that `Color` (struct) stays at `Windows.UI.Color` while `Colors`/`ColorHelper`
  move to `Microsoft.UI` (so a blanket `using` swap is unsafe).
- **Improvement:** promote into "Common build errors" with the unqualified fix + the
  Color/Colors split note; also auto-rewrite the qualified token in the bootstrap script.
- **Generalizes:** named-color brushes are ubiquitous in UWP samples.
