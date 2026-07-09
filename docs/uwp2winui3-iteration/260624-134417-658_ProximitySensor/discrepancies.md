# Discrepancies — Proximity sensor (UWP → WinUI 3)

**No functional discrepancies found.** All 4 source scenarios are present in the
migration with full control coverage, and every primary action button is behaviourally
wired, producing the correct no-sensor response that matches the UWP source handler.

| # | Scenario | Controls | Behavior (no-sensor hardware) | Verdict |
|---|----------|----------|-------------------------------|---------|
| 1 | Data Events | Enable, Disable ✓ | Enable → "No proximity sensors found"; Disable stays disabled | PASS |
| 2 | Polling | Get Data ✓ | Get Data → "No proximity sensor found" | PASS |
| 3 | Display On/Off | Enable, Disable ✓ | Enable → "No proximity sensors found"; Disable stays disabled | PASS |
| 4 | Background Proximity Sensor | Register Task, Unregister Task ✓ | Register Task → "No Proximity sensors found", Task Registration stays "Unregistered"; Unregister stays disabled | PASS |

All four "no-sensor" messages match the UWP source's `NotifyUser(...)` strings
(verified against `Scenario1..4_*.xaml.cs`). Disable / Unregister correctly remain
disabled because nothing was enabled/registered — matching the source.

## Measurement caveats (environment, not migration defects)

1. **UWP live capture.** The original UWP app launched and rendered — scenario-1 golden
   saved at `parity/baseline/screenshots/01_Data_Events.png`. Per-scenario UWP navigation
   and actuation could not be driven live: winapp's UIA tree for the UWP CoreWindow
   exposes only a top-level `Pane` (no children), and OS-level mouse injection is
   unavailable in this session (`SetCursorPos` clamps to 0,0; `GetForegroundWindow`
   returns 0). Scenarios 2–4 were compared via source + the WinUI UIA content.

2. **WinUI pixel capture.** The migrated WinUI 3 window renders logically (its full UIA
   tree — all controls, text, and state — is accessible), but pixel screenshots return
   blank/white because WinUI 3 Win32 content is not composited to a capturable surface on
   this headless desktop. Visual judgement relies on the per-scenario UIA dumps
   (`parity/winui3/ui/*.json`) and observed control text/state.

Neither caveat indicates a defect in the migration; both are properties of driving these
apps on this measurement host. The structural gate (`Compare-Parity.ps1`) passed 4/4 and
the behavioral actuation confirmed all primary controls are live.
