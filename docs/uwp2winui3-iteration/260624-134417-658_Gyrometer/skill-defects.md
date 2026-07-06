# Gyrometer — Skill Defects (skill absent/wrong → WILL change skill)

## 1. CS0118 'X is a namespace but is used like a type' (project named after a WinRT type)
- **Evidence:** session-log.txt 2419-2422, 2920-2922; csproj `<RootNamespace>Gyrometer</RootNamespace>` (line 1708).
- **Skill state:** absent (no CS0118 / collision / RootNamespace guidance anywhere in the skill).
- **Root cause:** project name = RootNamespace = WinRT type name → implicit namespace shadows the type.
- **Fix:** add a `Common build errors` entry prescribing a `using <X>Sensor = Windows.Devices.Sensors.<X>;`
  alias (or full qualification / RootNamespace rename), applied across all files at once.
- **Generalizes:** the whole `Windows.Devices.Sensors` sample family (Accelerometer, Gyrometer,
  Compass, Inclinometer, Magnetometer, OrientationSensor, LightSensor, Barometer, Altimeter,
  Pedometer, ProximitySensor, SimpleOrientationSensor…) and any sample named after a WinRT type.

## 2. CS0103 'The name App does not exist' (scaffold vs sample namespace mismatch)
- **Evidence:** session-log.txt 3669-3676; fix at turn 39 (`global::Gyrometer.App.MainWindow`).
- **Skill state:** absent — skill uses bare `App.MainWindow` in ~6 examples but never states the
  namespace precondition.
- **Root cause:** scaffold's `App`/`MainWindow` are in the project RootNamespace; migrated sample
  files keep their own namespace, so bare `App.MainWindow` doesn't resolve.
- **Fix:** same subsection — keep App/MainWindow namespace consistent with migrated code (set
  RootNamespace to the sample namespace, or fully-qualify `global::<RootNamespace>.App`).
- **Generalizes:** every SDKTemplate-derived sample keeps a namespace differing from the scaffold's
  project-name RootNamespace.
