# Lessons — CustomSensors UWP→WinUI 3 migration (score 100/100, builds ✓ runs ✓)

Clean, successful trial. Both features passed parity; the only friction was a build-error
cascade that the dev-agent worked through and recovered from.

## Key struggle (high value)
**SDK-sample namespace mismatch.** Windows-Universal-Samples put *every* class
(`MainPage`, `Scenario`, `SampleConfiguration`) under `namespace SDKTemplate` with
`x:Class="SDKTemplate.MainPage"`, but `dotnet new winui -n CustomSensors` scaffolds
`App`/`MainWindow` under `namespace CustomSensors`. The mismatch produced a cascade:
- `CS0246: 'MainPage' could not be found` (scaffold MainWindow.xaml.cs)
- `WMC0909: Cannot resolve DataType local:Scenario`
- `WMC1111: DataTemplates containing x:Bind need a DataType`
- `WMC1509: No LocalAssembly parameter`

The dev-agent spent several turns theorizing about `x:DataType`/LocalAssembly/assembly
name before identifying the root cause. **Fix:** keep `SDKTemplate` on migrated files and
add `using SDKTemplate;` to the scaffold's `MainWindow.xaml.cs` (or unify on one namespace)
so `MainPage`/`Scenario` resolve in both C# and XAML.

## Errors encountered
- CS0246 MainPage — namespace mismatch (above).
- WMC0909/WMC1111/WMC1509 — same mismatch cascade; also, a `DataTemplate` using `x:Bind`
  must declare `x:DataType`.
- WMC9997 multiple root elements — self-inflicted bad edit (trailing content), fixed by
  rewriting the file. Dev-agent slip, not a skill gap.

## Tool notes
- `Initialize-UwpMigration.ps1`, `Get-MigrationPattern.ps1 -Anchor windowing`, and
  `Validate-UwpMigration.ps1` all worked as intended.
- `Test-AppLaunch.ps1` reported "No build output under bin\x64\Debug" because the dev-agent
  used bare `dotnet build` (output under `bin\Debug\<tfm>\win-x64`) instead of the
  skill-prescribed `winapp build`. Recovered via `dotnet run`; validator smoke launch
  passed. Guidance already exists in SKILL.md Step 3 → dev-agent slip.

## Environment
- No physical custom CO2 sensor; device-absent fallback ('No custom sensor found') matched
  the UWP golden. UWP behavioral golden inconclusive (CoreWindow not UIA-actuable).
