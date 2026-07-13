# Lessons — AppServices (score 100, builds ✓, runs ✓)

A faithful migration (2/2 features pass), but the dev-agent spent **~4 build cycles**
(turns 35–41) on two recurring, generalizable problems.

## Dev-agent struggles
1. **Legacy `Properties\AssemblyInfo.cs` → CS0579 / CS0246 (turns 38–41).** The copied
   hand-authored `AssemblyInfo.cs` collides with the SDK-style project's auto-generated
   assembly attributes → `CS0579` duplicate-attribute errors in the app project, then
   `CS0246` unresolved attribute types in `RandomNumberService`. The agent first *trimmed*
   attributes (wasted a build), then emptied the file. Fixable mechanically at init.
2. **App Service provider activation (turns 34–37).** Porting the UWP in-process
   app-service provider branch failed: `ExtendedActivationKind.AppService` (CS0117) and
   `IAppServiceActivatedEventArgs` (CS0234) don't exist in WinAppSDK. Agent removed the
   branch. Also hit `CS0120` from the non-static `AppInstance.GetActivatedEventArgs()`.

## Errors → root cause → fix
- `CS0579 Duplicate Assembly*Attribute` → legacy AssemblyInfo.cs vs SDK auto-gen → empty the file.
- `CS0246 AssemblyDescriptionAttribute` → same file, partial trim insufficient → empty it.
- `CS0117 ExtendedActivationKind.AppService` / `CS0234 IAppServiceActivatedEventArgs` →
  provider-side app-service activation unsupported in WinAppSDK → drop / host out-of-process.
- `CS0120 AppInstance.GetActivatedEventArgs()` → must use `AppInstance.GetCurrent().GetActivatedEventArgs()`.
- `CS0246 MainPage` → missing `using SDKTemplate;`.

## Tooling limitation
`Initialize-UwpMigration.ps1` copies `AssemblyInfo.cs` verbatim → guaranteed CS0579.
Neutralize it at copy time (SDK owns assembly info).
