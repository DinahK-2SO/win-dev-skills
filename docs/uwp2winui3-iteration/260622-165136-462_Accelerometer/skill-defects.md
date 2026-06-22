# Skill defects — Accelerometer (WILL change skill)

## 1. Project-namespace vs WinRT-type collision (CS0118 / CS0576) — ABSENT
- **Evidence:** session-log turn 31 → 8× `CS0118: 'Accelerometer' is a namespace but is
  used like a type`; naive fix (`using Accelerometer = Windows.Devices.Sensors.Accelerometer;`)
  → turn 36 `CS0576 ... conflicting with alias 'Accelerometer'`. ~5 build cycles lost.
- **Skill search:** CS0118 / "namespace but is used" / CS0576 / RootNamespace / collision —
  none found. Existing CS0104 note covers only Xaml type ambiguity.
- **Root cause:** UWP samples name the project after the WinRT type they demo; the WinUI 3
  root namespace then shadows that type for unqualified references.
- **Fix:** Add a "Common build errors" entry: alias the WinRT type to a **distinct** name
  (`using AccelerometerSensor = Windows.Devices.Sensors.Accelerometer;`) or fully-qualify;
  warn against same-name aliasing (→ CS0576).
- **Generalizes:** whole sensor sample family + any feature-named sample.
