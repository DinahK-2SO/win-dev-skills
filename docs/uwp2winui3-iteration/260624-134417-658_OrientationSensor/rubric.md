# Parity Rubric — Orientation Sensor C# Sample (OrientationSensor)

Ground truth derived from the original UWP source and confirmed against the live UWP app
(launched, initial frame captured). Four scenarios, in source order.

## Scenario 1 — Choose orientation sensor (`Scenario0_Choose`)
- **Controls:** `ReadingTypeComboBox`, `OptimizationGoalComboBox`.
- **Expected:** Two dropdowns select the reading type (Absolute/Relative) and optimization
  goal (Precision/Power) used by the other scenarios. Defaults: **Absolute** + **Precision**.
- Not hardware-gated.

## Scenario 2 — Data Events (`Scenario1_DataEvents`)
- **Controls:** `ScenarioEnableButton` (Enable), `ScenarioDisableButton` (Disable), `ScenarioOutput`.
- **Expected:** Enable registers a `ReadingChanged` listener and streams rotation data;
  Disable unregisters it. **Enable is only enabled when a sensor is present** — otherwise the
  status shows "<sensor> not found".
- **Hardware-gated** (needs an orientation sensor).

## Scenario 3 — Polling (`Scenario2_Polling`)
- **Controls:** `ScenarioEnableButton` (Enable), `ScenarioDisableButton` (Disable), `ScenarioOutput`.
- **Expected:** Enable starts a `DispatcherTimer` polling `GetCurrentReading` at an interval;
  Disable stops it. Enable only enabled when a sensor is present.
- **Hardware-gated**.

## Scenario 4 — Calibration (`Scenario3_Calibration`)
- **Controls:** `High`, `Approximate`, `Unreliable` (RadioButtons) + `CalibrationBar`.
- **Expected:** Radio buttons simulate the current sensor accuracy. Selecting **Unreliable**
  invokes the calibration bar popup prompting the user to calibrate.
- **Not hardware-gated** — this is the one interactive behavior fully verifiable without a sensor.
