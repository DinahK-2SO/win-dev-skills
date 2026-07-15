# Parity Rubric — Barometer (UWP → WinUI 3)

Feature: **Barometer C# Sample** · Source: `uwp-samples-standalone/Samples/Barometer/cs`

**Hardware note:** This machine has **no barometer sensor**. `Barometer.GetDefault()`
returns `null`, so both scenarios settle to Status = **"No barometer found"** with
`hPa: No data`. This is the ground-truth terminal state for the golden and the candidate.

## Scenario 1 — Data Events (`Scenario1_DataEvents`)
- Description: "Registers an event listener for barometer data and displays the pressure in hPa values as they are reported."
- Controls: **Enable** (Button), **Disable** (Button)
- Outputs: `hPa:` value (No data when no sensor); shared Status block → "No barometer found"
- Behavior: Enable registers `ReadingChanged`; Disable stops it. No sensor → error only.

## Scenario 2 — Polling (`Scenario2_Polling`)
- Description: "Polls for barometer data and displays the pressure in hPa values."
- Controls: **Get Data** (Button)
- Outputs: `hPa:` value (No data when no sensor); shared Status block → "No barometer found"
- Behavior: Get Data reads current pressure. No sensor → error only.

## Verdicts
- **pass** — reachable, all controls present, visuals match golden, correct hardware-gated status.
- **partial** — reachable but missing controls, or a control that is live in UWP is dead in WinUI.
- **fail** — blank/unreachable, dropped scenario, or every frame blank even after actuation.
