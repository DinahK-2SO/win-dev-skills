# Discrepancies — AdaptiveStreaming (Iteration 1)

**Score: 78 | Builds: ✅ | Runs: ✅**

## Summary

The migration achieves 100% feature parity per independent evaluation (all 14 rubric features pass). The 22-point score deduction comes from the parity checker marking requirements 3, 4, and 7 as **partial** due to one systematic layout issue: **MediaPlayerElement is squeezed or invisible** in scenarios with tall control panels.

## Systematic Issue: MediaPlayerElement Layout

All affected scenarios share the same Grid layout pattern:
- **Row 0** (`Height="Auto"`): Description + controls (ContentSelector, radio buttons, ComboBoxes, seek buttons, LogView)
- **Row 1** (`Height="*"`): MediaPlayerElement

When Row 0 content is tall, it consumes all available vertical space, leaving Row 1 with 0–80px — too small for transport controls.

| Scenario | Controls in Row 0 | MediaPlayerElement Height |
|----------|-------------------|--------------------------|
| 3 (Request Modification) | Description + ContentSelector + 4 auth radio buttons + 3 HDCP radio buttons + LogView | ~80px (transport controls hidden) |
| 4 (Tuning) | Description + ContentSelector + bitrate indicators + 3 ComboBoxes + downgrade/headroom ratios + LogView | ~30px (invisible) |
| 7 (Live Seekable Range) | Description + ContentSelector + seekable window controls + position controls + 12 seek buttons + LogView | 0px (completely gone) |

**Scenarios 1, 2, 5, 6** have less content in Row 0 and display the MediaPlayerElement correctly.

## Requirements

| ID | Status | Issue |
|----|--------|-------|
| 1 | ✅ pass | — |
| 2 | ✅ pass | — |
| 3 | ⚠️ partial | MediaPlayerElement squeezed (~80px), transport controls not visible |
| 4 | ⚠️ partial | MediaPlayerElement squished (~30px), transport controls not visible |
| 5 | ✅ pass | — |
| 6 | ✅ pass | — |
| 7 | ⚠️ partial | MediaPlayerElement not visible at all |

## Visual Discrepancies

1. **Scenario 3** — MediaPlayerElement transport controls invisible (manual-s3.png)
2. **Scenario 4** — MediaPlayerElement barely visible, ~30px strip (manual-s4.png)
3. **Scenario 7** — MediaPlayerElement completely absent from view (manual-s7.png)
4. **Scenario 3** — ContentSelector "Load Uri" row not visible (may be clipped)

## Suspected Skill Gap

The migration skill faithfully copies Grid row definitions from UWP but provides no guidance on layout adjustments needed when:
- Auto-height rows contain many controls that collectively exceed window height
- Star-height rows are meant to hold media players that need minimum visible space

**Recommended fix:** Add migration guidance to set `MinHeight="300"` on MediaPlayerElement grid rows, or restructure tall control sections into a `ScrollViewer` with `MaxHeight` to prevent MediaPlayerElement from being pushed out of view.
