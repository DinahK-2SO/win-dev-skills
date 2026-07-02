# Parity Discrepancies - CustomUsbDeviceAccess

**Result:** Migration NON-FUNCTIONAL (does not build).

Migrated WinUI 3 app does not build (dotnet build/run exit 1). 11 compiler errors: Application.Suspending/Resuming not defined on WinUI 3 Microsoft.UI.Xaml.Application (Scenario1_ConnectDisconnect.xaml.cs, EventHandlerForDevice.cs); XAML WMC0909 'Cannot resolve DataType local:Scenario' + WMC1111 x:DataType missing + WMC9999 internal compiler error in MainPage.xaml. App is non-functional; cannot be launched.

## Per-scenario

- **Connect/Disconnect** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
- **Control Transfer** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
- **Interrupt Pipes** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
- **Bulk Pipes** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
- **USB Descriptors** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
- **Interface Settings** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
- **Sync Device** — FAIL: scenario absent in candidate (app does not build/launch). UWP golden present.
