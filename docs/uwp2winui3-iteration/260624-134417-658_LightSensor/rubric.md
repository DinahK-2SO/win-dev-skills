# Parity Rubric — Light Sensor (UWP → WinUI 3)

Ground truth: original UWP C# sample `LightSensor`, launched Release and captured live
(window title `LightSensorCS`, PID 55096). Two scenarios, each with the same control set.

## Scenario 1 — Data Events
- **Controls**
  - `ScenarioEnableButton` (Button, "Enable")
  - `ScenarioDisableButton` (Button, "Disable")
- **Actions to actuate**: Click Enable, Click Disable
- **Outputs**: `InputTextBlock` (description), `ScenarioOutput_LUX` (LUX value),
  shared `StatusBlock` / status border.

## Scenario 2 — Polling
- **Controls**
  - `ScenarioEnableButton` (Button, "Enable")
  - `ScenarioDisableButton` (Button, "Disable")
- **Actions to actuate**: Click Enable, Click Disable
- **Outputs**: `InputTextBlock` (description), `ScenarioOutput_LUX` (LUX value),
  shared `StatusBlock` / status border.

## Scoring notes
- The sample is **hardware-gated**: this machine has no light sensor, so in the *original
  UWP* app the Enable/Disable buttons produce no LUX output and the status reads
  **"No light sensor found."** A faithful WinUI 3 migration must reproduce that same
  fallback, not invent data.
- Each feature scores **pass** when all baseline controls appear in the WinUI UIA tree and
  behaviour matches the UWP golden (including the hardware-gated no-op).
