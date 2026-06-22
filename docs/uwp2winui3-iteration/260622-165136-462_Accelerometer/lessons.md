# Lessons — Accelerometer (iteration 1)

Final outcome: **score 100/100, builds clean, runs**. All friction was during the
build-fix loop (58 turns, 11 `dotnet build` runs), not in the final artifact.

## High-value dev-agent struggles
1. **Root-namespace ↔ WinRT-type collision (CS0118 → CS0576).** The WinUI project's
   root namespace is `Accelerometer`, identical to `Windows.Devices.Sensors.Accelerometer`.
   Unqualified `Accelerometer` resolves to the namespace → `CS0118 'is a namespace but is
   used like a type'` across 6+ files. The agent's first fix aliased the type to the
   **same** name (`using Accelerometer = ...`) → `CS0576 conflicting with alias`. It took
   ~5 build cycles before renaming the alias to `AccelerometerSensor`.
   *Generalizes:* UWP SDK samples are named after the WinRT feature/type they demo
   (Accelerometer, Compass, Gyrometer, Barometer, OrientationSensor, Inclinometer,
   LightSensor, Magnetometer, Pedometer, ProximitySensor …), so this collision recurs.

2. **`Colors` moved namespace (CS0103 → CS0234).** UWP `Colors.Green` (via `using
   Windows.UI;`) fails: `Colors`/`ColorHelper` moved to `Microsoft.UI`, while the `Color`
   struct stayed at `Windows.UI.Color`. The mapping exists in the namespace table but was
   buried; the agent missed it, burned 2 build cycles, and shipped a non-idiomatic
   `Windows.UI.Color.FromArgb(...)` workaround. *Generalizes:* many UWP samples set brush
   colors with `Colors.X`.

## Secondary
- **WMC9999 / WMC1509** XAML "internal error" + "No LocalAssembly" are *cascading
  symptoms* of a C# code-behind compile failure, not real XAML bugs. Fix the CS#### errors
  first.
- **Tooling gap:** `Initialize-UwpMigration.ps1` only rewrites `Windows.UI.Xaml →
  Microsoft.UI.Xaml`; the other moved `Windows.UI.*` namespaces (Colors/ColorHelper) are
  left for the agent to hand-fix.

## Environment
- No accelerometer hardware ("Standard accelerometer not found"). Symmetric in UWP golden
  and WinUI candidate → scored as a hardware gate, not a regression.
