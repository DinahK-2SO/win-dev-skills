# CredentialPicker — Lessons

**Outcome:** score 100, builds ✓, runs ✓, structural parity 100% (9/9, 10/10, 14/14). A very
clean migration — the lessons here are low-severity, generalizable friction, not failures.

## What worked
- **Initialize-UwpMigration.ps1** scaffolded + seeded mapping/TODOs cleanly.
- **Get-MigrationPattern.ps1 -Anchor csproj** delivered the csproj/manifest cheat-sheet.
- **Validate-UwpMigration.ps1** gated done (0 warnings, 0 WUI, fidelity PASS).

## Friction (both generalizable → coverage-gap)
1. **Manifest anchor not addressable.** `Get-MigrationPattern.ps1 -Anchor appxmanifest`
   → *"Anchor '#appxmanifest' not found"* (log 1751-1757). The manifest guidance was
   nested under the `csproj` anchor with no id of its own. Agent recovered by guessing
   `-Anchor csproj`. Every packaged migration reconciles the manifest, so the obvious
   anchor name should resolve.
2. **Nullable warnings from copied UWP code.** ~12 CS8618/CS8600/CS8602 across
   `SampleConfiguration.cs` (Title/ClassType) and the scenario code-behinds
   (`MainPage.Current`, event-handler casts) because the scaffold enables
   `<Nullable>enable</Nullable>` while UWP sample code predates NRT. The skill only
   illustrated the `App.MainWindow` case (line 186). Non-fatal, but recurs across the
   whole SDK-sample family (shared SharedContent).

## Special API
- **`CredentialPicker.PickAsync` is a static** system-dialog API — **no** InitializeWithWindow
  path (unlike instance pickers). Correct migration = verbatim namespace carry-over inside
  the existing try/catch. Its runtime no-op here is environment-gated (COMException in
  headless), flagged for manual review, **not** a defect.

## Environment (measurement, not migration)
- WinUI screenshots render blank (DirectComposition not PrintWindow-grabbable); parity was
  confirmed via the UIA text tree instead. UWP CoreWindow was not UIA-drivable, so only
  Scenario 1 golden exists.
