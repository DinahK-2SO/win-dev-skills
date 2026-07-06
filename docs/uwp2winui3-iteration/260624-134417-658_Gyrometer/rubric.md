# Gyrometer — UWP→WinUI 3 Parity Rubric

Ground truth: the original UWP Gyrometer C# sample (3 scenarios). Each scenario is
scored on control coverage, output-element fidelity, and behavior vs. the live UWP app.

## Scenario 1 — Data Events
- **Controls:** `ScenarioEnableButton` (Enable), `ScenarioDisableButton` (Disable)
- **Outputs:** description text, `ScenarioOutput_X/Y/Z`, shared `StatusBlock`
- **Initial state:** Enable enabled, Disable disabled; X/Y/Z = "No data"; status shows gyrometer presence ("No gyrometer found" on hardware-less machine).

## Scenario 2 — Polling
- **Controls:** `ScenarioEnableButton` (Enable), `ScenarioDisableButton` (Disable)
- **Outputs:** description text, `ScenarioOutput_X/Y/Z`, shared `StatusBlock`
- **Initial state:** same as Scenario 1.

## Scenario 3 — Cross-Platform Porting
- **Controls:** `GetSampleButton` (Get Sample)
- **Outputs:** description text, `ScenarioOutput_{X,Y,Z}_Windows`, `ScenarioOutput_{X,Y,Z}_WP`, shared `StatusBlock`
- **Initial state:** Get Sample disabled when no gyrometer; Windows (raw sample) and WP (transformed) columns show "No data".

## Verdicts
- **pass** — all controls/outputs present and behavior matches the UWP golden.
- **partial** — control present but dead vs. a responsive UWP control.
- **fail** — scenario missing/blank or <40% control coverage.
