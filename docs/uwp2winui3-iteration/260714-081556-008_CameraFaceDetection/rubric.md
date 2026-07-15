# Parity rubric — CameraFaceDetection

Single-page UWP sample (`FaceDetection.MainPage`): a full-window camera preview with a
face-detection bounding-box overlay and three floating buttons.

## Scenario 1 — CameraFaceDetection

| Control | Type | Role |
|---|---|---|
| PreviewControl | CaptureElement | Live camera preview surface (full window) |
| FacesCanvas | Canvas | Overlay hosting face bounding boxes |
| PhotoButton | Button | Capture a photo |
| VideoButton | Button | Start/stop video recording |
| FaceDetectionButton | Button | Toggle face detection on/off |

**Actions:** PhotoButton, VideoButton, FaceDetectionButton.

**Outputs:** camera preview frames; face bounding-box overlays.

**Hardware gating (important):** All three buttons start `IsEnabled="False"` and only
become enabled after a camera device is found and `MediaCapture` initializes. On a
machine with **no camera** they stay disabled — this is a property of the original UWP
app, not a migration defect. The UWP golden capture on this machine rendered only the
app splash (its CoreWindow content is not exposed via UI Automation through
ApplicationFrameHost), and none of its controls responded.
