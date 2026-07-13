# Skill coverage gaps (present but unclear → WILL change skill)

## 1. `Windows.UI.Colors` / `ColorHelper` not auto-rewritten; buried in the mapping table
- **Problem:** post-bootstrap code with `Windows.UI.Colors` fails **CS0103 'Colors' does
  not exist**; agent took 2 tries to land on `Microsoft.UI.Colors`.
- **Evidence:** CS0103 on `MainPage.xaml.cs:125,128`; commit note *"Fix Colors: use
  Microsoft.UI.Colors instead of Windows.UI.Colors"*; 44 bare `Colors.*` → 35
  `Microsoft.UI.Colors` in build-events.
- **Covered at:** `MIGRATION-PATTERNS.md:92` mapping row; `Initialize-UwpMigration.ps1`
  step-3 rewrite (matches only `Windows.UI.Xaml`).
- **Why missed:** grey-zone/under-emphasized — the row is buried under a header that
  says all namespaces auto-move; the bootstrap silently rewrites only `Windows.UI.Xaml`,
  so `Windows.UI.Colors`/`ColorHelper` are left broken with no flag that they're manual;
  never notes they move to the **`Microsoft.UI` root** (not `Microsoft.UI.Xaml`) while
  the `Windows.UI.Color` struct stays.
- **Fix:** extend the bootstrap script to rewrite `Windows.UI.Colors`/`ColorHelper`
  (word-boundary safe); annotate the mapping table auto-vs-manual + the root note.
- **Generalizes:** named-color status brushes are ubiquitous in UWP samples; the
  Windows.UI→Microsoft.UI root move is a fixed rename that recurs every scenario.
