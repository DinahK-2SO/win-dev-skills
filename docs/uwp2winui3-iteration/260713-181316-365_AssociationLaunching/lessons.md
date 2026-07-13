# Lessons — AssociationLaunching (UWP → WinUI 3)

Score: **100/100**, builds ✔, runs ✔, 0 parity regressions. All value here is in the
dev-agent's build-time struggles (the outcome was clean).

## Helpful
- **Initialize-UwpMigration.ps1** bulk-rewrote `Windows.UI.Xaml → Microsoft.UI.Xaml`
  (5/11 files) and scaffolded the project.
- **Pickers pattern** (MIGRATION-PATTERNS.md:272-279) was applied correctly —
  `FileOpenPicker` + `WinRT.Interop.InitializeWithWindow.Initialize(picker, hwnd)`.

## Key struggle #1 — `Colors` namespace (generalizable)
- UWP source: `new SolidColorBrush(Windows.UI.Colors.Green/Red)` for status coloring.
- After bootstrap, `Windows.UI.Colors` still failed (**CS0103 'Colors' does not exist**);
  agent's first fix (bare `Colors`) also failed; only `Microsoft.UI.Colors` compiled.
- **Root cause:** `Colors`/`ColorHelper` moved to the **`Microsoft.UI` root** (NOT
  `Microsoft.UI.Xaml`), and the bootstrap rewrite only handles `Windows.UI.Xaml`, so it
  leaves them broken. The mapping table lists the row but buries it and never says it's
  a manual, non-Xaml case.
- **Prevent:** extend the bootstrap to rewrite `Windows.UI.Colors`/`ColorHelper` and
  sharpen the doc (auto vs. manual rows; struct `Windows.UI.Color` stays).

## Key struggle #2 — stray brace (dev-agent slip, NOT a skill issue)
- `Scenario1/2_*.xaml.cs` hit **CS8803 / CS1022 / CS0106** from an extra closing brace
  that prematurely closed the class+namespace. Recovered in a few builds. Generic
  editing typo — no UWP knowledge gap, no skill change warranted.

## Measurement caveat (eval-side, out of scope)
- Legacy .NET Native sample never left the sample-framework splash for UIA, so no
  behavioral golden. Not a migration defect.
