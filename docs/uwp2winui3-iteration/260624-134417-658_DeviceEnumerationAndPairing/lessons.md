# Lessons — DeviceEnumerationAndPairing

Final score **100/100** (9/9 features pass, builds+runs). No parity defects. All
learnings come from the **dev-agent's build struggles** (4 failed builds before green).

## What worked
- `Initialize-UwpMigration.ps1` seeded 17 `TODO[migrate-NNN]: PATTERNS.md#threading`
  markers at every `CoreDispatcher`/`RunAsync` site and mass-rewrote namespaces.
- `Get-MigrationPattern.ps1 -Anchor threading` gave the correct `TryEnqueue` pattern.
- `Validate-UwpMigration.ps1` confirmed 0 WUI analyzer warnings.

## Build errors encountered (root cause → fix)
1. **CS0246 `DispatcherQueue` not found** (DeviceWatcherHelper.cs) — a non-Page helper
   class had no `using Microsoft.UI.Dispatching;` and no in-scope `DispatcherQueue`.
   Fixed by adding the using + injecting a `DispatcherQueue` through the constructor
   from each Page.
2. **WMC0909 "Cannot resolve DataType local:Scenario" + WMC1111 + WMC1509 + WMC9999**
   (MainPage.xaml) — **a cascade from the CS0246 C# failure**, not a XAML bug. The
   `x:DataType="local:Scenario"` was already correct and MainPage.xaml was never
   re-edited; the errors vanished once the C# compiled.
3. **CS0579 duplicate assembly attributes** — legacy `Tasks/Properties/AssemblyInfo.cs`
   compiled alongside the SDK's auto-generated attributes. Fixed with `<Compile Remove>`.

## Highest-value preventions (feed the skill)
- Threading section must show `using Microsoft.UI.Dispatching;` and state that helper
  classes (non-`DependencyObject`) must inject/fetch a `DispatcherQueue`.
- Add a diagnostic: WMC DataType-resolution errors on project-local `x:Bind` types are
  usually a **cascade from CS#### errors** — fix the C# and rebuild before touching XAML.
- `Initialize-UwpMigration.ps1` should not copy legacy `*AssemblyInfo.cs` into the live
  tree (the SDK auto-generates those attributes → CS0579).
