# Lessons — ApplicationData

## Tools
- **Initialize-UwpMigration.ps1** worked well — correctly identified all 4 files as migrate-as-is
- **Validate-UwpMigration.ps1** caught nullable warnings and confirmed clean build + successful launch

## Special APIs
- `ApplicationData.Current.ClearAsync()` — works unchanged in packaged WinUI 3
- `ApplicationData.Current.SetVersionAsync()` — works unchanged with SetVersionRequest/SetVersionDeferral

## Errors Encountered
- CS8618 nullable warnings on Scenario class — fixed by making properties nullable

## Dev Agent Struggles
- None — this was a smooth migration with no significant blockers
