# Skill defects (WILL change skill) — OrientationSensor

## 1. CS0118 — project-namespace equals WinRT-type-name collision
- **Evidence:** session-log.txt 3480-3482 (CS0118 in Scenario1_DataEvents:27, Scenario2_Polling:29 + WMC9999 XAML internal error); fixed turns 50-51 by fully qualifying `Windows.Devices.Sensors.OrientationSensor`.
- **Skill state:** absent. Only CS0104 (two Xaml namespaces) is covered at MIGRATION-PATTERNS.md:9-28; nothing about the project name matching a WinRT type.
- **Fix:** new "CS0118: namespace-equals-type collision" subsection — fully qualify the WinRT type at every use site; note the cascading WMC9999 clears once C# ambiguity is fixed.
- **Generalizes:** windows-universal-samples name each project after the WinRT type it demos → collision recurs for nearly every sensor/device sample.

## 2. CS0103 — App/MainWindow entrypoint namespace vs SDKTemplate sample body
- **Evidence:** session-log.txt 4145-4165 (CS0103 'App' across MainPage/CalibrationBar/Scenario files); fixed turn 56 with `using OrientationSensor;`. App/MainWindow = `OrientationSensor` namespace; sample body = `SDKTemplate`.
- **Skill state:** absent. App/MainWindow guidance exists (MIGRATION-PATTERNS.md:263-345) but never says which namespace the new entrypoint must use.
- **Fix:** instruct creating the new App/MainWindow in the SAME namespace as the migrated sample body (SDKTemplate), or bridge with a `using`. Check an existing file's namespace before writing App.xaml.cs.
- **Generalizes:** every windows-universal-samples migration adds a WinUI 3 App/MainWindow the UWP app lacked, while the body stays in SDKTemplate → recurring split.
