# Lessons — Altimeter (UWP → WinUI 3)

**Outcome:** score 100/100, both scenarios pass, builds + runs. Improvements come from
build-time friction, not parity failures.

## Tool limitations
- `Initialize-UwpMigration.ps1` mass-rewrite only handles `Windows.UI.Xaml`. It leaves
  `Windows.UI.Colors` / `Windows.UI.ColorHelper` untouched → guaranteed `CS0234` in any
  app that uses `SolidColorBrush(Colors.X)`.

## Errors encountered → root cause → fix
- **CS0234 `Colors` not found** → Colors/ColorHelper moved to `Microsoft.UI` → rewrite to
  `Microsoft.UI.Colors`.
- **CS0118 `'Altimeter' is a namespace but is used like a type`** → project root namespace
  equals a WinRT type name; the namespace shadows `Windows.Devices.Sensors.Altimeter` →
  rename root namespace to neutral `SDKTemplate` or alias the WinRT type.
- **CS0103 `App` does not exist** → scaffold files kept namespace `Altimeter` while copied
  UWP pages used `SDKTemplate`; pages couldn't see `App` → unify one root namespace.
- **CS8803/CS1022/CS0106 syntax cascade** → a botched multi-line edit (self-inflicted).

## Dev-agent struggles
- Mixed root namespaces (scaffold app-name vs UWP `SDKTemplate`) + app-name/WinRT-type
  collision caused a CS0103 + CS0118 cluster; preventable by a skill note to unify on the
  UWP source's namespace and watch for sensor-name/WinRT-type collisions.
- Colors rewrite gap; preventable by extending the bootstrap rewrite.

## Env
- No altimeter sensor on the machine → app shows its 'No altimeter found' fallback;
  hardware-gated, unverifiable on both sides, not a defect.
