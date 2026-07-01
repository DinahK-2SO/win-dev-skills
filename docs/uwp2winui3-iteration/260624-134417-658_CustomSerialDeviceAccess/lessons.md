# Lessons — CustomSerialDeviceAccess (UWP→WinUI 3)

**Outcome:** score 0. WinUI 3 build failed with 11 compiler errors; app never launched, so all 4 scenarios (Connect/Disconnect, Configure Device, Read/Write, Events) scored `fail`.

## Root causes

1. **`Application.Suspending` / `Application.Resuming` removed in WinUI 3 (primary).**
   UWP `EventHandlerForDevice` and `Scenario1_ConnectDisconnect` do
   `App.Current.Suspending += ...` / `App.Current.Resuming += ...` to close/reopen the
   serial device handle across process-lifetime transitions. `Microsoft.UI.Xaml.Application`
   has no such events (nor `EnteredBackground`/`LeavingBackground`) — desktop WinUI 3 apps
   aren't PLM-suspended. Result: 4× `CS1061`.
   - No `TODO[migrate-*]` was injected at these lines (inventory has no matching pattern).
   - PATTERNS.md `#lifecycle` covers `OnLaunched`/activation but is silent on suspend/resume.

2. **Cascading XAML DataType errors (secondary).**
   `WMC0909 Cannot resolve DataType local:Scenario`, `WMC1111 DataTemplates ... need x:DataType`,
   and `WMC9999` internal crash all stem from the failed C# compile — `SDKTemplate.Scenario`
   is public and the `x:DataType` was present and correct. Fix the C# errors and the WMC
   errors vanish. The agent had no guidance that WMC errors are commonly a C#-compile cascade.

## Generalization
The `EventHandlerForDevice` suspend/resume pattern is copy-pasted across the whole
device-access sample family (SerialPort, USB, HID, Bluetooth, PointOfService). The same
`Application.Suspending` CS1061 will recur in every one of them.
