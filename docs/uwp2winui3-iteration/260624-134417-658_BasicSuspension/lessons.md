# BasicSuspension — Lessons

**Outcome:** score 100, 1/1 feature PASS, builds + runs. Clean structural parity.

## Highest-value lesson
- **`Application.Suspending` / `Resuming` do not exist in WinUI 3 desktop.** The UWP
  `App.xaml.cs` (standard VS `SuspensionManager` template) wires
  `this.Suspending += OnSuspending;`. On WinUI 3 this fails with
  **`CS1061 'App' does not contain a definition for 'Suspending'`** (build log turn 16).
  The dev-agent fetched `Get-MigrationPattern.ps1 -Anchor lifecycle` (turn 17) but that
  anchor only covers **activation**, not suspend/resume — so it had to improvise the fix:
  save state on `window.Closed` and keep restore in `OnLaunched`.

## Secondary (agent slip, not a skill issue)
- The fix-up edit removed the `Suspending` wiring but **left the old `OnNavigationFailed`
  + `OnSuspending` methods stranded after the class brace**, causing
  `CS8803/CS0106/CS1022` (turn 19). A second edit deleted the orphans (turn 22). This was
  an editing-hygiene slip, not a missing-knowledge problem.

## Tools
- `Initialize/Validate-UwpMigration.ps1` and `Get-MigrationPattern.ps1` all worked.
- Validator PASS: 0 WUI warnings, smoke launch alive, visible-text fidelity intact.
