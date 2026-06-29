# Discrepancies — CameraGetPreviewFrame (improve trial view)

Score **100/100**, builds + runs, 4/4 controls, behavioral parity. There are **no
output-level discrepancies** (the score trial's own discrepancies.md confirms a full
control match; the blank WinUI screenshot is a content-island capture artifact, not a
defect).

The "discrepancies" worth acting on are **process** discrepancies on the path to parity:

| Item | Status | Suspected skill gap |
|---|---|---|
| Camera live preview (CaptureElement) | pass (after override) | Skill said *defer / no replacement*; agent had to ignore it and build a frame loop. |
| Suspend/resume teardown | pass (after ~8 turns) | Skill silent on `Application.Suspending/Resuming` removal → `Window.Activated`. |

Both generalize to other UWP→WinUI 3 camera / hardware-resource samples and are closed in
the improvement plan.
