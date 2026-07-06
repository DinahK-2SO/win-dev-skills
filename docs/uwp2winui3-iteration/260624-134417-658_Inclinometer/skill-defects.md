# Skill defects (skill absent/wrong → WILL change skill)

## 1. CS0118 project-namespace vs WinRT-type collision — ABSENT
- **Problem:** `private Inclinometer _inclinometer;` → **CS0118 'Inclinometer' is a namespace but is used like a type** (mig turn ~57). Fixed by fully qualifying `Windows.Devices.Sensors.Inclinometer`.
- **Skill search:** No hit for `CS0118` / "is a namespace but is used like a type" / `RootNamespace`. Only **CS0104** (ambiguous between two `using`s) is documented — a *different* error.
- **Root cause:** Root/assembly namespace is derived from the sample folder name; many samples are named after the WinRT type they demo, so the namespace shadows the type → bare uses bind to the namespace.
- **Fix:** Add a `CS0118` subsection under "Common build errors after the namespace rewrite" → fully qualify the type.
- **Generalizes:** Inclinometer, Accelerometer, Gyrometer, Compass, Barometer, Pedometer, Battery, Geolocator … any single-API sample named after its type.
