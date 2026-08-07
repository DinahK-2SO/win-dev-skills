# PowerGrid migration lessons

- **Highest leverage:** bootstrap copied only 4 physical files while the UWP project declared 16 linked items in sibling shared folders. This forced about 15 turns of manual shell, XAML, style, asset, and API reconstruction.
- **Useful tools:** `dotnet new winui`, focused `Get-MigrationPattern.ps1` anchors, and `Validate-UwpMigration.ps1` worked. The validator ultimately reported a clean build and live smoke launch.
- **Tool friction:** Python was unavailable, .NET Native output could not be loaded with `Add-Type`, and `Test-AppLaunch.ps1` missed a valid `bin\Debug` layout.
- **Build diagnostics:** `LaunchActivatedEventArgs` and `DispatcherQueue` were ambiguous; the latter needs the `Microsoft.UI.Dispatching` qualification when `Windows.System` is also imported. `WMC9999` was secondary to earlier actionable errors.
- **Outcome nuance:** candidate parity reported 2/2 pass, but the official feature score was 50 because the UWP reference stayed on its splash screen. The migration trial itself timed out after starting a redundant foreground `dotnet run`.
