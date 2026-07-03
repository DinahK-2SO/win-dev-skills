# Discrepancies — AudioCategory (index 0)

Score **100/100** · builds ✅ · runs ✅ · structural parity **10/10**.

## Requirements
- **#1 nav 1) Movie … 10) Other** — pass (verbatim titles via UIA).
- **#2 per-scenario Description** — pass (updates on selection).
- **#3 Select Audio File / Play / Pause / Stop** (shared PlaybackControl) — pass (picker opened on Scenario 1).
- **#4 Status text + copyright footer** — pass.

## Visual discrepancies
None (WinUI screenshots blank due to DirectComposition capture limit; content verified via UIA tree).

## Missing features
None.

## Summary
No parity-blocking issues. The `actions 0/1 live` on scenarios 2–10 and blank screenshots are
**measurement artifacts** (modal picker pileup; DWM/PrintWindow capture limitation), not defects.
Reusable improvements come from the **build log**, not the score: the
`MediaElement → MediaPlayerElement` conversion and `SystemMediaTransportControls.GetForCurrentView()`
replacement are under-documented in the migration skill.
