# Skill defects (WILL change skill) — Barometer

## 1. `SDKTemplate` namespace not reconciled to scaffold root namespace  → script + doc
- **Evidence:** failed builds at log lines 2354 (CS0246 SDKTemplate not found), 2749-2751
  (CS0103 `App`), 2357-2358/3224-3225 (WMC0909/WMC1111 x:Bind `local:Scenario`); 33
  `SDKTemplate` edits across MainPage, SampleConfiguration, both Scenario files.
- **Skill state:** absent (no `SDKTemplate` / namespace-reconciliation guidance anywhere).
- **Root cause:** bootstrap rewrites only `Windows.UI.Xaml`→`Microsoft.UI.Xaml`; the sample
  keeps `namespace SDKTemplate` while the scaffold App/MainWindow use the project namespace.
- **Fix:** `Initialize-UwpMigration.ps1` reconciles the `SDKTemplate` token → scaffold root
  namespace across all copied `.cs`/`.xaml` before the agent builds.
- **Generalizes:** `SDKTemplate` is universal across the Windows-universal-samples corpus.

## 2. Project-name == WinRT-type collision → CS0118  → doc
- **Evidence:** log lines 2354-2355 `CS0118 'Barometer' is a namespace but is used like a
  type`; fixed with `using BarometerSensor = Windows.Devices.Sensors.Barometer;`.
- **Skill state:** absent (no CS0118 / alias guidance).
- **Root cause:** project named after the WinRT type it uses; root namespace shadows it.
- **Fix:** new MIGRATION-PATTERNS.md entry — alias or fully-qualify the WinRT type.
- **Generalizes:** the whole sensor/device sample family (Compass, Accelerometer, …).
