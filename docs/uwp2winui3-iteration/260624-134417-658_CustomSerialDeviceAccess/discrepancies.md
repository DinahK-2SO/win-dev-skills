# Parity discrepancies — CustomSerialDeviceAccess

- **score:** 0 | **builds:** false | **runs:** false
- All 4 rubric features (Connect/Disconnect, Configure Device, Read/Write, Events) → `fail`,
  all for the same reason: the WinUI 3 app does not compile (11 errors), so nothing can be
  launched, captured, or actuated.
- Every UWP golden control (buttons, toggles, combos, textboxes across all 4 scenarios) is
  reported as an "unverifiable-control" / "dead-action" purely because the app never runs.

**Single upstream cause:** unmigrated `Application.Suspending`/`Resuming` event
subscriptions (4× CS1061). The `WMC0909`/`WMC1111`/`WMC9999` XAML errors on `MainPage.xaml`
are a cascade from the failed C# compile (the `SDKTemplate.Scenario` type and its
`x:DataType` are actually valid).
