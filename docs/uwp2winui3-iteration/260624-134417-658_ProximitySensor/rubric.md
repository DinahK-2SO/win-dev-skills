# Rubric — Proximity sensor (UWP → WinUI 3)

Derived from the UWP source (`SampleConfiguration.cs` + each `ScenarioN_*.xaml[.cs]`).
The sample is **hardware-gated**: with no proximity sensor present, every scenario's
primary action is expected to surface a "no sensor" status rather than data.

## Scenario 1 — Data Events
- Controls: **Enable**, **Disable** (Disable initially disabled).
- Outputs: `Detected:`, `Distance (mm):`, `Timestamp:` (all "No data" at rest).
- Behavior: Enable subscribes to `ReadingChanged`; no sensor → status **"No proximity sensor(s) found"**, Disable stays disabled.

## Scenario 2 — Polling
- Controls: **Get Data**.
- Outputs: `Detected:`, `Distance (mm):`, `Timestamp:`.
- Behavior: Get Data polls `GetCurrentReading`; no sensor → status **"No proximity sensor found"**.

## Scenario 3 — Display On/Off
- Controls: **Enable**, **Disable** (Disable initially disabled).
- Behavior: Enable arms display-off-on-proximity; no sensor → status **"No proximity sensor(s) found"**.

## Scenario 4 — Background Proximity Sensor
- Controls: **Register Task**, **Unregister Task** (Unregister initially disabled).
- Outputs: `Task Registration:`, `Task Status:`, `Report Count:`, `Last Report Timestamp:`, `Detected:`.
- Behavior: Register Task registers a background task **only when a sensor exists**; no sensor → status **"No Proximity sensors found"**, `Task Registration` stays **"Unregistered"**.

## Grading
Each scenario is PASS when: reachable + renders, all named controls present, and the
primary action is behaviourally wired (produces the correct no-sensor response, matching
the UWP handler). A present-but-dead control caps a scenario at PARTIAL.
