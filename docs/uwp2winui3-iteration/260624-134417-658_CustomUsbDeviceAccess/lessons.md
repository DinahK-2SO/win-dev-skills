# Lessons — CustomUsbDeviceAccess (UWP→WinUI 3)

**Outcome:** score 0, build FAILED, 7/7 features fail. App never launched.

## Root causes (both generalizable)
1. **`Application.Suspending` / `Application.Resuming` copied verbatim.** WinUI 3
   `Microsoft.UI.Xaml.Application` removed these events plus the
   `SuspendingEventHandler` / `SuspendingEventArgs` types. Used across
   `EventHandlerForDevice.cs`, `Scenario1_ConnectDisconnect.xaml.cs`,
   `Scenario4_BulkPipes.xaml.cs`. → CS compile errors.
   - Fix: remove the suspend/resume wiring; relocate cleanup to `Window.Closed` /
     `AppWindow.Closing`. Desktop apps have no suspend/resume.
   - The migration **inventory had no entry** for this, so no TODO was injected and the
     validator never flagged it.
2. **Split root namespace broke compiled bindings.** `MainPage.xaml.cs` +
   `SampleConfiguration.cs` were left in namespace `SDKTemplate` while every
   `Scenario*.cs` stayed `CustomUsbDeviceAccess`. `x:DataType="local:Scenario"` +
   `{x:Bind Title}` could not resolve → `WMC0909` / `WMC1111`, cascading to a `WMC9999`
   internal compiler error.
   - Fix: keep C# `namespace`, `x:Class`, and `xmlns:local="using:..."` consistent;
     x:Bind/x:DataType resolve types by CLR namespace.

## Dev-agent struggle
- Turns 82–99: launched `dotnet build` 4×, polled with 120–600s waits, restarted the
  shell repeatedly, and **ran out of turns with the build still running** — never saw the
  full error list. net10.0 WinUI first build is slow and its progress-dot output hid the
  error lines. Preventable by redirecting build output to a file and grepping `error`.

## Tooling note
- `unsupported-api-inventory.json` drives `Initialize-UwpMigration.ps1` TODO injection and
  `Validate-UwpMigration.ps1` residue grep. Adding the lifecycle Suspending/Resuming
  pattern (anchor `#lifecycle`) is the highest-leverage, ignore-proof fix.
