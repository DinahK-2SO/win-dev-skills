# Parity discrepancies — Accelerometer

- **score 0/6, builds=true, runs=false.** App crashes at `Application.Start` before any window appears, so all six scenarios are unreachable.

| # | Feature | Status | Why |
|---|---------|--------|-----|
| 1 | Choose accelerometer (ComboBox) | fail | startup crash |
| 2 | Data events (Enable/Disable, X/Y/Z) | fail | startup crash |
| 3 | Shake events | fail | startup crash |
| 4 | Polling | fail | startup crash |
| 5 | Orientation change | fail | startup crash |
| 6 | Data events batching | fail | startup crash |

**Visual:** no WinUI screenshot exists for any scenario (`winui_screenshot=null` ×6); UWP golden shows the scenario ListBox + per-scenario controls.

**Suspected skill gap:** startup-crash diagnosis anti-pattern (don't mutate the entry point) is present but buried; agent hand-rolled an MTA `Program.cs` instead of fixing the activation path.
