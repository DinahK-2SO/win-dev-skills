# Lessons — Background Activation (UWP → WinUI 3)

## What worked
- `Initialize-UwpMigration.ps1` triaged every file and rewrote namespaces; build was clean apart from ~30 nullable warnings.
- Dev-agent correctly adapted `Application.OnBackgroundActivated` (no WinUI 3 override) by wiring `group.BackgroundActivated += BackgroundActivity.Start` in the `App` constructor.

## Root causes worth generalizing
1. **Legacy background model compiles but is behaviourally dead.** The migrated app kept `Windows.ApplicationModel.Background` (`BackgroundTaskBuilder.Register()`, `SystemTrigger`, `BackgroundExecutionManager`) 1:1. It builds and renders, but the **Register button produced no Status change** because a packaged WinUI 3 app needs a `windows.backgroundTasks` `<Extensions>` declaration (copied `Package.appxmanifest` had none) to actually run in-process tasks. This capped every scenario at *partial*.
2. **Analyzer under-detects the in-process background family.** `unsupported-api-inventory.json` only matches `IBackgroundTask|BackgroundTaskBuilder`; apps using `BackgroundExecutionManager` / `BackgroundTaskRegistrationGroup` / `SystemTrigger` / `OnBackgroundActivated` without those exact tokens dodge the routing.
3. **`Application.OnBackgroundActivated` has no WinUI 3 equivalent** — a recurring transform that the skill's background-tasks section never spells out.

## Measurement limitations (not skill issues)
- UWP golden never composed (splash only); background registration is environment-gated → behaviour unverifiable both sides.
- Parity nav-by-verbatim-title missed the numbered ListBox titles → all 6 winui3 parity frames identical (eval-tool limitation).
