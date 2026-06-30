# Parity Rubric — CameraStarterKit

**Ground truth:** live UWP app (Release / .NET Native) launched via `uwp-app-runner`
(window title `Camera Starter Kit C# Sample`, pid 5704). Single-page sample.

## Scenario 1 — CameraStarterKit (MainPage)

| Control | UWP type | WinUI 3 equivalent | Role |
|---|---|---|---|
| PreviewControl | `CaptureElement` | `Image` (`PreviewImage`) via SoftwareBitmap | live camera preview surface |
| PhotoButton | `Button` (Camera `SymbolIcon`) | `Button` (`PhotoButton`) | capture photo; disabled until camera init |
| VideoButton | `Button` (red `Ellipse`/white `Rectangle`) | `Button` (`VideoButton`) | start/stop recording; disabled until camera init |

**Expected behavior:** app initializes the default camera on load. With no camera the
two buttons stay **disabled** and the preview is blank. With a camera the preview
streams and both buttons enable.

**Hardware-gated:** yes. This machine has **no camera**, so the UWP ground truth shows
both buttons disabled over a blank preview. The migration must replicate that same
state; a visible fallback message is a bonus (defensive UI).
