# Lessons — AppServices (UWP → WinUI 3)

Migration **scored 100/100** (2/2 features pass, clean build, smoke launch alive). The
signal is in the friction the agent overcame, not in a failed outcome.

## Helpful tools
- **Initialize-UwpMigration.ps1** — seeded MIGRATION-MAPPING.md (9 rows) + TODO markers.
- **Validate-UwpMigration.ps1** — caught unfinished `Status=copied` rows; confirmed PASS.

## Doc error (high-value)
- **MIGRATION-PATTERNS.md#background-tasks** blanket-says "IBackgroundTask is not the
  recommended model — use BackgroundTaskBuilder / Task Scheduler." This is **wrong for an
  in-process AppService provider**, which MUST stay an `IBackgroundTask` whose
  `TriggerDetails` is an `AppServiceTriggerDetails`. `BackgroundTaskBuilder` does not host
  app services. The agent had to override the skill ("the only valid implementation for
  AppService hosting").

## Special APIs (no skill coverage at all)
- **AppServiceConnection** (`Windows.ApplicationModel.AppService`) — supported on WinUI 3
  desktop with package identity; client code migrates **as-is**.
- **App-service provider** — `IBackgroundTask` kept verbatim; hosted via
  `<uap:Extension Category="windows.appService">` + `<uap3:AppService Name="..."/>`, with
  `EntryPoint` updated to the merged namespace; hardcoded PackageFamilyName replaced with
  `Package.Current.Id.FamilyName` when client+provider merge into one package.

## Errors encountered
- **Validator FAIL: 9 rows still `Status=copied`** → bootstrap seeds rows as `copied`;
  agent hadn't flipped them. Fixed by bulk `copied`→`done`. (Slip — already documented.)

## Analyzer gap
- `unsupported-api-inventory.json` has no `AppServiceConnection` / `AppServiceTriggerDetails`
  pattern, so the app-service code got **no routing TODO** — the agent adapted it unaided.
