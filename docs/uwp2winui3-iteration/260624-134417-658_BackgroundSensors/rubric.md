# Rubric — BackgroundSensors

Feature: **Background sensors** (1 scenario)

## Scenario 1 - Accelerometer DeviceUse

Launches a DeviceUse trigger background task to listen for accelerometer data.
Displays the number of data samples received by the background task.

### Controls
- **Enable** (`ScenarioEnableButton`, Button) — registers the accelerometer DeviceUse
  background task. When a sensor is present, disables Enable and enables Disable.
- **Disable** (`ScenarioDisableButton`, Button) — unregisters the background task and
  restores the initial button state.

### Outputs
- **Sample count** (`ScenarioOutput_SampleCount`, TextBlock) — `Sample count: <n>` or `No data`.
- **Status** (`StatusBlock`, TextBlock) — e.g. `No accelerometer found` when no sensor hardware is present.

### Hardware gating
This scenario requires a physical accelerometer. On a machine without one, **both** the
UWP original and the WinUI 3 migration display **"No accelerometer found"** and the
Enable/Disable buttons produce no sample data. This is expected behavior, not a defect.
