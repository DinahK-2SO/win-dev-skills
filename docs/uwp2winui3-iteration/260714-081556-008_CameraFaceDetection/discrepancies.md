# Parity discrepancies — CameraFaceDetection

- **Score:** 50 (partial). Builds: yes. Runs: yes.
- **Requirement (partial):** camera face-detection page. All controls present in UIA (PhotoButton, VideoButton, FaceDetectionButton, PreviewImage). Buttons disabled because no camera on the VM → behavior unverifiable, not a regression.
- **Visual:** UWP showed a blank splash (camera-gated); WinUI shows a defensive "No camera device found" panel — an improvement.
- **Suspected skill gap:** skill marks `CaptureElement` as *unsupported → defer* with "no compatible replacement." The correct migration (Image + SoftwareBitmapSource fed by MediaCapture frames) had to be discovered by the agent. Obeying the skill would have deferred the entire camera page.
