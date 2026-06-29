# UWP Rubric — CameraOpenCV C# Sample

Ground truth derived from the original UWP source
(`Samples/CameraOpenCV/cs`, `shared/Scenario1_ExampleOperations.xaml`) and confirmed
against the live UWP golden capture.

## Scenario 1 - Example Operations

UI elements (in source order):

- `CurrentOperationTextBlock` (TextBlock) — "Current: Blur" *(major)*
- `OperationComboBox` (ComboBox) — operation selector; `SelectionChanged` re-applies the
  chosen OpenCV operation to the output frame *(critical)*
- `PreviewImage` (Image) — live camera preview *(major)*
- `OutputImage` (Image) — OpenCV-processed output *(major)*
- `FPSMonitor` (TextBlock) — frames per second *(minor)*
- `StatusBlock` (shared) — status text *(output)*

Pass criteria: scenario page renders non-blank; ComboBox present and actually switches the
processing; Preview/Output images present (the camera feed itself may be empty on a box
with no camera — that is acceptable, a blank *page* is not).
