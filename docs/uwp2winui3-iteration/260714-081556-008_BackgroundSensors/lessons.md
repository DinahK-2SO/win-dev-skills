# Lessons — BackgroundSensors (run25)

**Outcome:** score 100, builds true, runs true (1/1 feature pass). Clean migration, but one
real recovered runtime failure worth generalizing.

## Highest-value lesson: retained in-process background task needs manifest registration
- The UWP app uses `DeviceUseTrigger` + an in-process WinRT `IBackgroundTask`
  (`BackgroundTask.Scenario1_BackgroundTask`). This trigger type is still bound to the
  in-process WinRT model, so the correct migration is to **keep** `IBackgroundTask`, not
  replace it with `BackgroundTaskBuilder`.
- The `windows.backgroundTasks` Extension was migrated, but a **clean `dotnet build`**
  (0 errors, 0 WUI warnings) hid a packaging defect. `Test-AppLaunch.ps1` (TURN 47) failed
  AppX registration:
  > `0x80080204: ... not allowed to have EntryPoint="BackgroundTask.Scenario1_BackgroundTask"
  > without ActivatableClassId in windows.activatableClass.inProcessServer.`
- **Root cause:** a packaged WinUI 3 desktop app must additionally register the task class
  as an in-process COM server via `windows.activatableClass.inProcessServer`. UWP did this
  implicitly; WinUI 3 / packaged Win32 does not.
- **Fix (TURN 48):** added
  `<Extension Category="windows.activatableClass.inProcessServer"><InProcessServer><Path>App.dll</Path><ActivatableClass ActivatableClassId="…" ThreadingModel="both"/></InProcessServer></Extension>`.

## Tools
- Helpful: `Get-MigrationPattern.ps1`, `Validate-UwpMigration.ps1`, `Test-AppLaunch.ps1`.
- Limitation: `Validate-UwpMigration.ps1` check 5b validates Windows.Desktop/rescap/runFullTrust
  but does **not** check the backgroundTasks→inProcessServer pairing, so the defect surfaced
  late (only at launch).

## Doc gap
- `MIGRATION-PATTERNS.md > Background Tasks` only steers toward `BackgroundTaskBuilder` / push
  activation and never covers the "keep the in-process task + register it in the manifest" path.
