# Lessons — BackgroundTask (UWP → WinUI 3)

**Outcome:** score 50 — 6/6 scenarios render faithfully but every **Register** button is dead.

## Root cause (one line)
The migrated app keeps the **classic out-of-process** `BackgroundTaskBuilder` model
(`Windows.ApplicationModel.Background`, string `TaskEntryPoint = "Tasks.SampleBackgroundTask"`,
`builder.Register()`), but the **build** `Package.appxmanifest`
(`app/BackgroundTask/Package.appxmanifest`) declares **no**
`<Extension Category="windows.backgroundTasks">`. `Register()` therefore throws at runtime;
the handler has no try/catch, so the failure is swallowed and the control looks dead.

## Key evidence
- The UWP source manifest (with the two `windows.backgroundTasks` extensions) was copied into a
  **nested** folder `BackgroundTask/BackgroundTask/Package.appxmanifest` and never merged into the
  build manifest.
- `RegisterBackgroundTask` (SampleConfiguration.cs line ~113) calls `builder.Register()` with no
  try/catch; `UpdateUI()` (Scenario1_...xaml.cs) never sees `registered=true`.

## Tooling gaps
- `Validate-UwpMigration.ps1` manifest checks (section 5/5b) verify image refs + Windows.Desktop /
  rescap / runFullTrust, but do **not** verify that UWP `<Extension>` declarations the code still
  depends on were carried over. It passed a manifest that breaks `Register()`.

## Generalizable takeaways
1. Retaining the classic `IBackgroundTask`/`BackgroundTaskBuilder` model requires the
   `windows.backgroundTasks` `<Extension>` in the **build** manifest — a runtime prerequisite, not
   optional branding.
2. UWP `<Extensions>` (backgroundTasks, protocol, fileTypeAssociation, appService, shareTarget) are
   **not** merged automatically; the migration must reconcile them into the WinUI 3 manifest.
3. Registration/activation calls that depend on manifest declarations should be wrapped in try/catch
   so a missing declaration surfaces instead of presenting as a dead control.
