# Lessons — CustomSerialDeviceAccess (UWP→WinUI 3)

Final score: **100/100**, builds ✅, runs ✅. No parity regressions. All improvement
signal comes from the **build/runtime friction** the dev-agent hit on the way there.

## Errors encountered → root cause → fix
1. **CS1061 `Application.Suspending`/`Resuming` missing** — WinUI 3
   `Microsoft.UI.Xaml.Application` dropped the UWP suspend/resume lifecycle events.
   Copied verbatim from the UWP `EventHandlerForDevice.cs` / `Scenario1`. Fix: delete the
   `App.Current.Suspending/Resuming` subscriptions, drop `SuspendingEventArgs`; the
   suspend-throttling logic is simply inert on desktop. (~20 build-loop turns)
2. **Startup crash `0xC000027B` in Microsoft.UI.Xaml.dll, clean build** — inner managed
   `XamlParseException: Cannot find a Resource with the Name/Key SampleHeaderTextStyle`.
   The custom shared style lived in `SharedContent/xaml/Styles.xaml`, which was never
   merged into the migrated app's resource dictionary. `{StaticResource}` to a missing
   *custom* key resolves at build but throws at runtime. Fix: copy the referenced style
   definitions into `App.xaml`. (~9 turns of crash-diagnosis)
3. **WMC0909 Cannot resolve DataType `local:Scenario`** — `x:Bind`/`x:DataType` on a
   project-local type inside a `NavigationView.MenuItemTemplate` failed to resolve on the
   first markup pass. Fix: use classic `{Binding Title}` without `x:DataType`.

## Helpful tooling
- `Validate-UwpMigration.ps1` smoke-launch caught the startup crash a clean build hid.
- `winapp run <layout> --debug-output` converted the opaque native `0xC000027B` into the
  actionable `Cannot find a Resource … SampleHeaderTextStyle`.
- `Get-MigrationPattern.ps1 -Anchor startup-crashes` gave the exception-code table and
  the "capture the real exception first" discipline.

## Tool limitation
- `-Anchor lifecycle` covers only `OnLaunched`/activation, not the *removed*
  `Suspending`/`Resuming` events — the agent had to derive that itself.

## Highest-leverage, generalizable gaps
- Removed lifecycle events (`Suspending`/`Resuming`) — recurs in any UWP app that manages
  resources across suspend (device/file/media handles).
- Missing shared-content styles at runtime — recurs across **every** Windows-universal-
  samples migration, which all reference `SharedContent/xaml/Styles.xaml`.
