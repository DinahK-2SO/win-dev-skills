# Parity Rubric — CameraOpenCV

**Feature:** CameraOpenCV C# Sample
**Source:** `uwp-samples-standalone/Samples/CameraOpenCV/cs` (+ `shared`)

## Scenario 1 — Example Operations

Shows the output of various OpenCV operations over live camera frames.

### UI elements
- **CurrentOperationTextBlock** (TextBlock) — shows `Current: <operation>`; updates on ComboBox selection.
- **OperationComboBox** (ComboBox) — populated with 5 operations: Blur, HoughLines, Contours, Histogram, MotionDetector. `SelectionChanged` updates the current operation and the text block.
- **PreviewImage** (Image) — raw camera frame *(hardware-gated)*.
- **OutputImage** (Image) — OpenCV-processed frame for the selected operation *(hardware-gated)*.
- **FPSMonitor** (TextBlock) — `FPS: N` while frames arrive *(hardware-gated)*.

### Actions to actuate
- **OperationComboBox** → select an item → `currentOperation` changes and `CurrentOperationTextBlock` is rewritten.

### Hardware gate
Camera capture via `MediaCapture` / `MediaFrameReader`. With no camera present the app must present a graceful fallback (not blank/broken).

> Note: `Extract-UwpFeatureChecklist` reported 0 controls/actions (it did not parse the ComboBox). This rubric records the real controls read from the XAML + code-behind and drives the manual visual + behavioral judgment.
