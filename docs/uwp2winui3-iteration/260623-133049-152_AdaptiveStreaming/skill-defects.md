# Skill defects (skill is absent/wrong → WILL change skill)

## 1. CS0103 after the namespace rewrite — non-Xaml `Windows.UI.*` siblings not remapped
- **Problem:** `CS0103 'Colors' does not exist` (LogView.xaml.cs:112), and the same class
  for any unqualified member of `Windows.UI` (`Colors`, `ColorHelper`) / `Windows.UI.Text`
  (`FontWeights`, `FontStyle`).
- **Evidence:** migration-score.json build error #1; source uses
  `new SolidColorBrush(Colors.Red)` and `Windows.UI.Colors.Green`.
- **Skill state:** **absent.** The "Common build errors" section covers CS0104, CS0227,
  CS0246 — **no CS0103 entry.** The Namespace Mapping table lists the row passively but
  not as a build-error remedy, and omits the per-type caveat.
- **Root cause:** the bootstrap rewrite (`Initialize-UwpMigration.ps1` L113) only maps the
  `Windows.UI.Xaml.*` family; the non-Xaml `Windows.UI.*` siblings are left untouched.
- **Fix:** add a CS0103 entry to "Common build errors": remap `Windows.UI → Microsoft.UI`
  (`Colors`/`ColorHelper`) and `Windows.UI.Text → Microsoft.UI.Text`
  (`FontWeights`/`FontStyle`) by hand; warn that the `Color` **struct** stays
  `Windows.UI.Color` (per-type split, so no blind whole-`using` rewrite).
- **Generalizes:** color/font styling from code-behind is ubiquitous in UWP samples; the
  bootstrap deterministically leaves these unmapped, so the CS0103 recurs broadly.
