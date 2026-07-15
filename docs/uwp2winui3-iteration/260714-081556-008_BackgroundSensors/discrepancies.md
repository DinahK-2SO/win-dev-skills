# Discrepancies — BackgroundSensors (UWP → WinUI 3)

**Result: no discrepancies.**

The migrated WinUI 3 app faithfully reproduces the single sample scenario
("Accelerometer DeviceUse"):

- Full structural control coverage (2/2): `ScenarioEnableButton` (Enable),
  `ScenarioDisableButton` (Disable) present in the UIA tree.
- Output elements present: Sample count ("No data"), Status block
  ("No accelerometer found").
- Description text matches the source.
- Defensive fallback shown for the missing device:
  "This sample requires an accelerometer that is not available on this machine."
  — so the page never renders blank.

## Behavioral note (not a discrepancy)

Enable/Disable did not produce output in **either** app because the machine has no
accelerometer (the scenario is hardware-gated). The UWP source's `Scenario1_DeviceUse`
ctor reports "No accelerometer found" when `Accelerometer.GetDefault()` is null, matching
the WinUI status. The UWP golden also recorded 0/2 responding actions, so there is no
dead-control regression to flag.

## Capture caveat

The original UWP app launched successfully (Release, pid 13992) but its CoreWindow
presented only the extended splash to UI Automation, so the golden content screenshot is
the splash. Visual fidelity was therefore judged from the WinUI rendered frames against
the UWP **source**, which the migration reproduces correctly.
