# Lessons — Pedometer (UWP → WinUI 3)

Outcome: **score 100/100**, all 4 features pass, builds + runs. But the migration agent
hit two build-error classes the skill does **not** currently cover. Both are generalizable.

## Errors encountered (root cause → fix)

1. **CS0118 / CS0234 — namespace/type collision.**
   `Pedometer.GetDefaultAsync()` and `Pedometer.GetReadingsFromTriggerDetails(...)` failed
   with "'Pedometer' is a namespace but is used like a type". Root cause: the WinUI
   project's `RootNamespace`/assembly name is `Pedometer` — identical to the WinRT type
   `Windows.Devices.Sensors.Pedometer` — so the bare identifier binds to the project
   namespace. Fix: `using SensorPedometer = Windows.Devices.Sensors.Pedometer;` (or
   `global::`-qualify). **Recurs** for every SDK sample named after the feature it demos
   (Pedometer, Compass, Accelerometer, Gyrometer, Barometer, Altimeter, Camera, …).

2. **CS0579 — duplicate assembly attributes.**
   Legacy `Properties\AssemblyInfo.cs` and `Tasks\Properties\AssemblyInfo.cs` were copied
   as source; SDK-style projects auto-generate the same `[assembly: ...]` attributes
   (`GenerateAssemblyInfo` defaults true) → duplicates. Fix:
   `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>` or delete the legacy files.
   **Recurs** in essentially every UWP→WinUI migration that copies the `Properties` folder.

## Non-blocking noise
- Many **CA1416** platform-compatibility warnings (DatePicker/TimePicker/Calendar/Pedometer
  history APIs). Build succeeds and runs; expected, ignorable.

## Tools
- `Initialize-UwpMigration.ps1` handled the bulk namespace rewrite and bin/obj exclusion
  well (no CS0101 flood). Its one gap: it copies `AssemblyInfo.cs` (cause of #2).
