# Lessons — Altimeter (UWP → WinUI 3)

**Outcome:** Migration scored 100/100 (2/2 features pass, builds + runs). One real
failure occurred during development and was recovered before completion.

## What worked
- **Initialize-UwpMigration.ps1** — scaffolded the target, seeded the 4-row mapping,
  and auto-neutralized `RootFrameNavigationHelper` (content-filter hazard) before the
  agent saw it.
- **Validate-UwpMigration.ps1** — its 10s smoke launch caught a startup crash that a
  clean build + silent analyzer could not, forcing a fix before "done".
- **Get-MigrationPattern.ps1** — supplied windowing/threading/csproj/startup-crashes
  anchors on demand.

## The one real error (recovered)
- **Startup crash `0xC000027B`** (native stowed exception, `Microsoft.UI.Xaml.dll`).
- **Root cause:** `MainWindow` constructor called `RootFrame.Navigate(typeof(MainPage))`
  during `new MainWindow()` — before `App.OnLaunched` assigned `App.MainWindow` — so the
  page read a still-null static window reference and threw at startup.
- **Fix:** deferred first navigation into the `Window.Activated` handler (guarded flag),
  so it runs after `Activate()`. Validator then PASSed.

## Skill-facing takeaways
1. `MIGRATION-PATTERNS.md` documents this init-order race clearly under **#windowing**,
   but the crash-code table only lists it under `0x80004003` (E_POINTER). Here it
   surfaced as `0xC000027B`, whose row points only at "defer an unsupported API" — a
   misleading dead-end for a weaker run.
2. `SKILL.md` Shell Conversion (where the agent *builds* the MainWindow + Frame + Navigate
   shell) never cross-references the "keep the constructor inert / defer navigation"
   pitfall, so the agent wrote navigate-in-constructor and only learned better after the
   crash.

## Hardware / measurement notes (no migration-skill action)
- No altimeter on the machine: both UWP golden and WinUI app show "No altimeter found".
- UWP CoreWindow is UIA-opaque; Scenario 2 (Polling) ground truth taken from source.
