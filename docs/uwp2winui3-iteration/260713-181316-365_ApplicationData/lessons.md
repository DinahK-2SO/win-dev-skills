# Lessons — ApplicationData (index 0)

**Outcome:** score 100/100, builds ✅, runs ✅, 2/2 features pass. Only friction was one build failure that self-resolved in ~3 turns.

## What worked
- **Initialize-UwpMigration.ps1** — bootstrapped the port, rewrote `Windows.UI.Xaml → Microsoft.UI.Xaml` in 3/9 files, seeded the mapping table.
- **Validate-UwpMigration.ps1** — caught mapping rows stuck at `copied`, then confirmed clean residue + build + smoke launch.
- **CoreDispatcher → DispatcherQueue** conversion — handled cleanly per the Threading section.

## The one real problem (root cause)
- The bootstrap only rewrites `Windows.UI.Xaml`. The UWP page used **`Windows.UI.Colors.Green/Red`**, which was left untouched → **CS0234** at build turn 26.
- That C# failure **cascaded** into `XamlCompiler WMC0909 "Cannot resolve DataType local:Scenario"` (+ WMC1111/WMC1509/WMC9999) — because the project's local assembly never built, not because of any `x:DataType` mistake.
- Fixing only the Colors namespace made the entire build (incl. XAML) go green.

## Preventable by
1. Bootstrap auto-rewriting `Windows.UI.Colors → Microsoft.UI.Colors` (safe leaf static class).
2. Validator residue flag for non-Xaml `Windows.UI.(Colors|Text|Composition|Input)`.
3. Doc note: `WMC0909`/`WMC1509` during MarkupCompilePass2 is usually a downstream C# compile failure — fix the CS errors first.

## Env note (eval-side, not skill)
- Locked-screen session meant the original UWP could not be actuated; behavioral truth was taken from source. Not a migration-skill concern.
