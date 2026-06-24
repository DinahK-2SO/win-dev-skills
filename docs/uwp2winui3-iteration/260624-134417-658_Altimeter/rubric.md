# Parity Rubric — Altimeter

Ground truth derived from the original UWP source and confirmed against the live UWP app
(window title "Altimeter C# Sample"). This machine has **no altimeter device**, so both
scenarios are hardware-gated: the live UWP app shows Status **"No altimeter found"**, the
output reads **"No data"**, and the sensor-action buttons are disabled. A faithful WinUI 3
migration must reproduce the same control set, layout, default text, and the same
hardware-gated fallback behavior.

## Scenario 1 - Data Events
- **Controls:** `ScenarioEnableButton` (Enable), `ScenarioDisableButton` (Disable)
- **Outputs:** `InputTextBlock` (description), `ScenarioOutput_M` (Altitude change(m)), `StatusBlock`
- **Expected:** Enable subscribes to the altimeter ReadingChanged event; Disable unsubscribes.
  With no device, Status = "No altimeter found", Disable disabled.

## Scenario 2 - Polling
- **Controls:** `ScenarioGetDataButton` (Get Data)
- **Outputs:** `InputTextBlock` (description), `ScenarioOutput_M` (Altitude change(m)), `StatusBlock`
- **Expected:** Get Data polls a single current reading. With no device, Status =
  "No altimeter found", Get Data disabled.
