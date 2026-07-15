# Skill Coverage Gaps (present but under-enforced → WILL change skill)

## 1. `Windows.UI.Colors` relocation is documented but not auto-applied
- **Problem:** `SolidColorBrush(Windows.UI.Colors.Green/Red)` → CS0234; needs `Microsoft.UI.Colors` + `using Microsoft.UI;`.
- **Evidence:** session-log.txt:2622-2623 (error), :2635-2641 (fix). Bootstrap log :279 shows only `Windows.UI.Xaml` was rewritten.
- **Covered at:** MIGRATION-PATTERNS.md:92 mapping row `Windows.UI.Colors | Microsoft.UI.Colors`.
- **Why missed:** buried in a table framed as "Windows.UI.**Xaml**.* namespaces"; `Colors` is a type not a namespace; and `Initialize-UwpMigration.ps1` (line 126) only rewrites `Windows.UI.Xaml`, so nothing enforces the row.
- **Improvement:** extend the bootstrap mass-rewrite to also map `Windows.UI.Colors`→`Microsoft.UI.Colors` and `Windows.UI.ColorHelper`→`Microsoft.UI.ColorHelper` (word-boundary guarded so the `Windows.UI.Color` struct stays), plus residueOnly patterns in the validator.
- **Generalizes:** status-block coloring is ubiquitous across the sample-template family; auto-applying removes a recurring hand-fixed CS0234.
