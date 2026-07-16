# Rubric — Camera resolution C# sample (`CameraResolution`)

Ground-truth feature list derived from the UWP source and used to grade the migrated
WinUI 3 app. Three scenarios, each with a `Preview Settings` combo, an `Initialize
Camera` button, a shared `Status` output region, and a scenario-specific control.

## Scenario 1 — Change camera preview settings
- Controls: ComboBox "Preview Settings", Button "Initialize Camera"
- Action: Initialize Camera → applies chosen preview stream resolution/framerate; status updates.
- Output: StatusBorder / StatusBlock.

## Scenario 2 — Change preview and photo settings
- Controls: ComboBox "Preview Settings", ComboBox "Photo Settings", Button "Initialize Camera" (+ Take Photo)
- Action: Initialize Camera → preview and photo resolutions set independently.
- Output: StatusBorder / StatusBlock.

## Scenario 3 — Match aspect ratios
- Controls: ComboBox "Preview Settings", ComboBox "Video Settings", Button "Initialize Camera" (+ Record Video)
- Action: Initialize Camera → video aspect ratio matched to preview stream.
- Output: StatusBorder / StatusBlock.

## Grading dimensions
1. **Structural** — each control present in the WinUI 3 UIA tree.
2. **Behavioral** — Initialize Camera actuates and produces visible status change.
3. **Visual** — layout matches the SDK sample chrome (nav list, description, controls, status).

All camera operations are hardware-gated: with no camera present the correct, non-crashing
observable is a visible "denied access to the camera" status.
