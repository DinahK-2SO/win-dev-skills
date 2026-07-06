# Migration Rubric — Lamp device C# sample (`LampDevice`)

Ground-truth feature list derived from the original UWP source and confirmed against
the live UWP app (visual golden) and the running WinUI 3 migration.

## Scenario 1 — Get Lamp Instance
- **Controls:** `Button` "Get Lamp Instance from DeviceInformation", `Button` "Get Default Lamp Instance", `TextBox` outputBox
- **Expected:** each button acquires a Lamp instance and logs progress to outputBox. With no lamp hardware, expect a "No lamp device found" error.

## Scenario 2 — Enable Lamp and Settings Adjustment
- **Controls:** `Button` "Adjust Brightness and turn on Lamp", `Button` "Adjust Color and turn on Lamp", `TextBox` outputBox
- **Expected:** each button initializes the lamp and adjusts brightness/color then turns it on. With no lamp hardware, expect "Initializing lamp" then "No lamp device was found".

## Scenario 3 — Lamp Device Change Events
- **Controls:** `Button` "Register for AvailablityChanged Event", `Button` "Unregister for AvailablityChanged Event", `ToggleSwitch` lampToggle (OnContent "Lamp On" / OffContent "Lamp Off"), `TextBox` outputBox
- **Expected:** Register/Unregister subscribe to the lamp AvailabilityChanged event; lampToggle turns the lamp on/off but is **disabled until a lamp is acquired** (hardware-gated). With no lamp hardware, Register/Unregister report "No lamp device was found" and the toggle stays disabled.
