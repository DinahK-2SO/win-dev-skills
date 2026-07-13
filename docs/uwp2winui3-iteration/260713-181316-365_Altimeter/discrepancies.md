# Parity Discrepancies — Altimeter

**Score 100/100 — builds ✓ runs ✓ — 6/6 rubric features pass.**

All six rubric features (navigation list, Enable/Disable, Data Events output, Get Data,
Polling output, no-altimeter status) verified pass. The app is hardware-gated (no
altimeter), identically to the UWP golden, so non-updating output is parity, not a defect.

## Visual / behavioral nuance (not regressions)
- **Data Events initial Enable state** — UWP leaves `Enable` enabled even with no sensor
  (clicking just re-shows "No altimeter found"); WinUI disables Enable/Disable and adds a
  "requires an altimeter device" message. Graceful degradation, not a dead control.
- **Additive** — WinUI adds a defensive no-sensor explanatory text absent in UWP. Positive.

## Development-time defect (recovered, not visible in final parity)
- Startup crash `0xC000027B` from `RootFrame.Navigate(...)` in the `MainWindow`
  constructor (init-order race). Fixed by deferring navigation to the `Activated` event.
  This is the source of the skill improvements below.
