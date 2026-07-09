# Parity Rubric — Relative Inclinometer

Feature derived from the UWP source (`Samples/RelativeInclinometer/cs`). Two scenarios.

## Scenario 1 — Data events
- **Controls:** Enable (`ScenarioEnableButton`), Disable (`ScenarioDisableButton`).
- **Outputs:** Pitch / Roll / Yaw (`ScenarioOutput_X/Y/Z`), shared `StatusBlock`.
- **Behavior:** Enable registers a `ReadingChanged` handler and streams pitch/roll/yaw;
  Disable unregisters. No sensor ⇒ status "No relative inclinometer found", outputs
  "No data", Disable disabled.

## Scenario 2 — Polling
- **Controls:** Get Data (`GetDataButton`).
- **Outputs:** Pitch / Roll / Yaw (`ScenarioOutput_X/Y/Z`), shared `StatusBlock`.
- **Behavior:** Get Data polls once and displays current reading. No sensor ⇒ button
  disabled, outputs "No data", status "No relative inclinometer found".

## Scoring
`round(100 * (pass + 0.5*partial) / features_total)`. A control present but **dead**
relative to a responsive UWP golden is at best `partial`. Controls inert in **both** apps
because of missing hardware are **parity, not regression**.
