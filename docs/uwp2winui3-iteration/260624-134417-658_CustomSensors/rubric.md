# Parity Rubric — CustomSensors

Ground truth derived from the running original UWP app + its source. Two scenarios.

## Scenario 1 - Data events
- **Controls:** `Enable` button, `Disable` button (disabled initially).
- **Outputs:** description text, `CO2 level (ppmv):` value (default `No data`), status text.
- **Expected behavior:** Enable registers a CO2 custom-sensor event listener. With no
  CO2 sensor hardware present, the status reports `No custom sensor found` and CO2 level
  stays `No data`. Disable stays greyed until a sensor is successfully enabled.

## Scenario 2 - Polling
- **Controls:** `Get CO2 level` button.
- **Outputs:** description text, `CO2 level (ppmv):` value (default `No data`), status text.
- **Expected behavior:** Get CO2 level polls the sensor. With no sensor present the status
  reports `No custom sensor found` and CO2 level stays `No data`.

## Scoring
`score = round(100 * (pass + 0.5*partial) / features_total)`, 0 if the app cannot run.
A control present but dead (responds in UWP golden, dead in WinUI) is at best `partial`.
