# PenHaptics — Discrepancies (UWP vs WinUI 3)

Score **80/100**, builds clean, runs. 4/5 scenarios pass.

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Ink Canvas Tactile Feedback | **FAIL** | Whole scenario dropped from nav (page labeled `defer`/`unsupported-only`; only 4 scenarios registered). Should have been kept with a placeholder. |
| 2 | Query Tactile Feedback Support | pass | Matches UWP. |
| 3 | Inking Feedback | pass | Waveform ComboBox + Intensity slider + inking area match. |
| 4 | Interaction Feedback | pass | Button present/wired; Compare-Parity FAIL was a title-ambiguous eval capture artifact, not a defect. |
| 5 | Inking and Interaction Feedback | pass | Draggable square + grid match. |

**Only real gap:** scenario 1 is missing from navigation. Root cause is the tooling
collapse-to-`defer` + the "omit deferred from nav" invariant, which together drop a whole
scenario page whose only blocker is an unsupported hero control instead of keeping it with
a placeholder.
