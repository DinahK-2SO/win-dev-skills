# Skill coverage gaps — AudioCreation (WILL change skill)

## 1. `Colors` namespace split → CS0103 (UNDER-EMPHASIZED)
- **Evidence:** session-log ~5486+ (47× CS0103 'Colors'), 5745 ("The Colors class needs
  `using Microsoft.UI;` in WinUI 3"), 5748 (fix).
- **Covered at:** MIGRATION-PATTERNS.md line 92 — mapping table row
  `Windows.UI.Colors → Microsoft.UI.Colors`.
- **Why missed:** the table row reads as a find/replace. It omits that the migrated code
  needs an explicit `using Microsoft.UI;`, and that the `Color` struct stays in
  `Windows.UI` — so both usings are required and unqualified `Colors.Red` keeps failing.
- **Improvement:** add a build-errors entry for CS0103 'Colors' (require `using Microsoft.UI;`,
  note the Color/Colors split) and annotate the mapping-table row.
- **Generalizes:** any code-behind that sets colors via `SolidColorBrush(Colors.X)`.
