# Lessons — Accelerometer (UWP→WinUI 3)

**Outcome:** Score 0/100. Migrated app did not build → no scenario reachable.

## Root cause (single, dominant)
`dotnet new winui -n Accelerometer` set `<RootNamespace>Accelerometer</RootNamespace>` and the
scaffold's `App`/`MainWindow`/`MainPage` to `namespace Accelerometer`. The migrated source
(`namespace SDKTemplate`) references the WinRT type **by simple name** (`Accelerometer.GetDefault()`
under `using Windows.Devices.Sensors;`). The simple name `Accelerometer` then bound to the app's
own **namespace** instead of the **type** → `CS0118` x9 (Scenario1-5) + a XAML `WMC9999`
internal compiler crash.

## Why it generalizes
UWP SDK samples are habitually named after the API they demo: Accelerometer, Compass, Gyrometer,
Barometer, ProximitySensor, Battery, Altimeter, Pedometer, etc. Any such sample scaffolded under
its own name reproduces this exact collision.

## Errors
- `CS0118 'Accelerometer' is a namespace but is used like a type` (Scenario1-5 .xaml.cs).
- `XamlCompiler WMC9999` NRE in MarkupCompilePass2 (downstream of the same collision).

## Dev-agent behaviour
- Migrated file-by-file but **never ran `dotnet build` or the validator**; ran out of turn budget
  at TURN 26 still viewing source/assets. The latent collision was never surfaced in-trial.

## Tooling gap
- `Initialize-UwpMigration.ps1` did not detect or repair the scaffold namespace/type collision.

## Fix applied
- Bootstrap now detects when the scaffold root namespace equals a type referenced (by simple name)
  in the copied source and renames the scaffold root namespace to `<Name>App`, updating
  `<RootNamespace>`, scaffold `namespace` declarations, `x:Class`, and `xmlns:local`. Source files
  are left on their original namespace. Documented in SKILL.md Step 0.
