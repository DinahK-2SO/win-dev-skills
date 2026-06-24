# Discrepancies — ActivitySensor

**Score 88** · builds ✅ · runs ✅ · structural parity 100% (8/8 controls, 4/4 scenarios)

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Current activity | pass | Get Current Activity invoked; no-sensor message (faithful). |
| 2 | Activity history | pass | Get Activity History invoked; output updated. |
| 3 | Events | pass | On responded; Off disabled until On (by design). |
| 4 | Background activity | partial | Register Task fully wired (BackgroundTaskBuilder + ActivitySensorTrigger) but no verifiable response on a sensorless machine; no UWP behavioral golden → manual review, not fail. |

## Visual
- All WinUI 3 screenshots render blank (PrintWindow/BitBlt vs DirectComposition capture limitation). **Not a defect** — UIA tree fully populated (38 elements) and text matches UWP.

## Summary
Faithful migration. The only real engineering friction was **CS0579 duplicate-attribute** build failures from stale nested UWP `obj`/`bin` `.cs` artifacts being copied and globbed into the project — addressed by the skill improvement below.
