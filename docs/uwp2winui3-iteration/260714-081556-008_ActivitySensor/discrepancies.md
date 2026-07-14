# Discrepancies — ActivitySensor

Score 88 · builds ✓ · runs ✓ · 3/4 pass, 1 partial.

## Requirements
- **#1 Current activity** — pass.
- **#2 Activity history** — pass.
- **#3 Events (ReadingChanged On/Off)** — pass (Off inert in both = parity).
- **#4 Background activity / Register Task** — **partial**. Responds in UWP (status bar updates) but **dead** in WinUI (no status change, frame unchanged).

## Visual discrepancy
- **Register Task:** UWP updates the status bar to a device-gated message and refreshes Task Registration/Status; WinUI shows no response.
  - `parity/winui3/screenshots/04_Background_activity.png` vs `parity/baseline/screenshots/04_Background_activity__a01_Register_Task.png`

## Summary
The single regression is a present-yet-dead control: the migrated `async void` handler calls the
out-of-process UWP API `BackgroundExecutionManager.RequestAccessAsync()`, which throws in WinUI 3
desktop; with no try/catch the exception is swallowed and the button gives no UI feedback.
