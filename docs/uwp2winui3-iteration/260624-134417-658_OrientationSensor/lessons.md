# Lessons — OrientationSensor (UWP → WinUI 3)

**Outcome:** 100/100, builds ✅, runs ✅, 4/4 features pass. Two build-fix cycles were
needed, both caused by **namespace problems** that recur across the windows-universal-samples set.

## Errors encountered (root cause → fix)

1. **CS0118 — `'OrientationSensor' is a namespace but is used like a type`**
   - Root cause: the migrated project's root namespace is `OrientationSensor` (the sample
     is named after the WinRT API it demos), which is identical to
     `Windows.Devices.Sensors.OrientationSensor`. Unqualified `OrientationSensor` binds to
     the namespace, not the type.
   - Fix: fully qualify every usage → `Windows.Devices.Sensors.OrientationSensor`
     (including `.GetDefault(...)` and `OrientationSensorReading`).
   - Also triggered a cascading `WMC9999` XAML compiler internal error that cleared once
     the C# ambiguity was fixed.

2. **CS0103 — `The name 'App' does not exist in the current context`**
   - Root cause: the agent created the new WinUI 3 entrypoint types (`App`, `MainWindow`)
     in the **project-name** namespace `OrientationSensor`, while every migrated sample
     file stayed in the sample's `SDKTemplate` namespace. Cross-namespace `App.*`
     references were unresolved.
   - Fix: add `using OrientationSensor;` to the `SDKTemplate` files (or put `App`/
     `MainWindow` in the same `SDKTemplate` namespace as the sample body).

## Dev-agent struggles
- ~2 turns lost to the CS0118 collision (namespace == type).
- ~1 turn lost to the CS0103 App/namespace mismatch.

Both are **generalizable**: windows-universal-samples routinely (a) name the project after
the WinRT type being demonstrated, and (b) keep shared/scenario code in the `SDKTemplate`
namespace while the WinUI 3 entrypoint the agent adds lands in the project namespace.
