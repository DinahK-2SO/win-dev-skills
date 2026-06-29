# Rubric — CameraFaceDetection

Single-page UWP sample (`FaceDetection.MainPage`). One scenario.

## Scenario 1 — CameraFaceDetection

Full-window camera preview with a face-detection bounding-box overlay and three
command buttons that stay **disabled until the camera initializes**.

### UI elements
- **PreviewControl** — camera preview surface (UWP `CaptureElement`, migrated to an `Image`). Blank when no camera is present.
- **FacesCanvas** — `Canvas` overlay (inside an outer `Canvas`) that hosts face bounding boxes, aligned to the preview via a `RenderTransform`.
- **PhotoButton** — `Camera` symbol icon. `Click=PhotoButton_Click`. Starts disabled; takes a photo when the camera is ready.
- **VideoButton** — start (red `Ellipse`) / stop (white `Rectangle`) icon. `Click=VideoButton_Click`. Starts disabled; toggles recording.
- **FaceDetectionButton** — `Contact` / `Contact2` icon. `Click=FaceDetectionButton_Click`. Starts disabled; toggles face detection.

### Ground-truth behavior on a camera-less machine
The original UWP app launches, shows a blank preview, and leaves all three buttons
**disabled** (they are visible as grey rounded controls). No control is actionable
because the feature is hardware-gated. A faithful migration must reproduce this:
all controls present, all disabled, preview blank — ideally with a visible fallback
message so the page is not indistinguishable from a crash.
