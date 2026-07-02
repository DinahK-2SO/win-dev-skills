# Skill-defects — DataReaderWriter (WILL change skill)

## 1. Non-Xaml `Windows.UI.*` type moves not rewritten by the bootstrap
- **Problem:** `Windows.UI.Colors` / `Windows.UI.ColorHelper` moved to `Microsoft.UI` in
  WinApp SDK but the bootstrap only rewrites `Windows.UI.Xaml`, so ported code fails with
  **CS0234**.
- **Evidence:** `session-log.txt:2231-2232` — `error CS0234 ... 'Colors' does not exist in
  the namespace 'Windows.UI'` at `MainPage.xaml.cs(110,63)/(113,63)`; fixed at 2284-2287.
- **Skill state:** absent — `Initialize-UwpMigration.ps1` §3 rewrites only
  `Windows.UI.Xaml`; no residue rule covers `Colors`/`ColorHelper`.
- **Root cause:** mechanical namespace move omitted from the bootstrap rewrite set.
- **Proposed fix:** rewrite `Windows.UI.Colors`/`Windows.UI.ColorHelper` → `Microsoft.UI.*`
  in the bootstrap (word-boundary so the `Windows.UI.Color` struct is preserved); add the
  same as a `residueOnly` validator pattern; add a caveat note in MIGRATION-PATTERNS.md.
- **Generalizes:** color brushes from named colors are ubiquitous in UWP apps; the move is
  deterministic, so a tooling fix helps every future migration.
