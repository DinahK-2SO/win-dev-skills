# Discrepancies — AdaptiveStreaming (iteration 1)

**Score**: 77 | **Builds**: ✅ | **Runs**: ✅

## Requirements

| ID | Status | Summary |
|----|--------|---------|
| 1 | ✅ pass | Scenario 1 — Load button + MediaPlayerElement |
| 2 | ✅ pass | Scenario 2 — ContentSelector, bitrate indicators, LogView |
| 3 | ⚠️ partial | Scenario 3 — Controls present but MediaPlayerElement zero-height |
| 4 | ⚠️ partial | Scenario 4 — Controls present but MediaPlayerElement zero-height |
| 5 | ✅ pass | Scenario 5 — Metadata display |
| 6 | ✅ pass | Scenario 6 — Ad insertion |
| 7 | ⚠️ partial | Scenario 7 — DVR controls present but MediaPlayerElement absent |

## Visual Discrepancies

1. **Scenario 3** — MediaPlayerElement invisible (zero height). Screenshot `03_Network_Request_Modification.png` shows controls and log but no video player area.
2. **Scenario 4** — MediaPlayerElement invisible (zero height). Screenshot `04_Adaptive_Streaming_Tuning.png` shows bitrate controls and log but no video player area.
3. **Scenario 7** — MediaPlayerElement completely absent from UIA tree. Screenshot `07_Live_Seekable_Range.png` shows DVR controls and log but no video player area.

## Root Cause

All three partial failures share a single root cause: the dev-agent's shell layout (NavigationView + header + StatusPanel with MaxHeight=200) consumes viewport height. Scenario pages use `Height="*"` for the MediaPlayerElement row, but when Auto-height control panels above and below are tall enough (radio buttons, HDCP controls, ComboBoxes, DVR buttons), the `*` row collapses to zero.
