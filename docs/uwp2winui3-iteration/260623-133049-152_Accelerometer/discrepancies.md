# Migration Discrepancies - Accelerometer

**Verdict:** Migration non-functional. Score **0 / 100** (0 pass, 0 partial, 6 fail of 6).

## Ground truth (UWP)
Original UWP app launched successfully (Release, PID 2236, window "Accelerometer C# Sample").
All 6 scenarios captured to parity/baseline/screenshots/. No physical accelerometer on this
machine, so UWP data/polling controls report "No data" / "Standard accelerometer not found"
(hardware-gated — a property of the host, not a migration defect).

## Candidate (WinUI 3)
`dotnet build` FAILED with 9 errors — app cannot launch, so no WinUI capture was possible:
- CS0118 'Accelerometer' is a namespace but is used like a type — Scenario1_DataEvents.xaml.cs,
  Scenario2_ShakeEvents.xaml.cs, Scenario3_Polling.xaml.cs, Scenario4_OrientationChanged.xaml.cs (x4),
  Scenario5_DataEventsBatching.xaml.cs
- XamlCompiler WMC9999 internal error (NullReferenceException) in MarkupCompilePass2

Root cause: the project root namespace collides with the `Windows.Devices.Sensors.Accelerometer`
type; every `Accelerometer` type reference resolves to the app's own namespace.

## Per-feature
| # | Feature | Verdict | Reason |
|---|---------|---------|--------|
| 1 | Choose accelerometer | fail | candidate unbuildable/unreachable |
| 2 | Data events | fail | candidate unbuildable/unreachable |
| 3 | Shake events | fail | candidate unbuildable/unreachable |
| 4 | Polling | fail | candidate unbuildable/unreachable |
| 5 | Orientation change | fail | candidate unbuildable/unreachable |
| 6 | Data events batching | fail | candidate unbuildable/unreachable |
