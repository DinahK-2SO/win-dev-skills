# Parity Rubric — CameraAdvancedCapture

Single-page UWP sample (no scenario list). Ground truth derived from
`shared/MainPage.xaml` + `MainPage.xaml.cs`, confirmed against the live UWP app.

## Scenario 1 — CameraAdvancedCapture

UI elements (in source order):

- **PreviewControl** — camera preview surface. UWP `CaptureElement` → WinUI
  `MediaPlayerElement`.
- **CycleModeButton** — cycles advanced-capture mode; disabled until camera ready.
  Contains **ModeTextBlock** with text `Standard` + an `AttachCamera` symbol icon.
- **PhotoButton** — takes a photo (`PhotoButton_Click`); disabled until camera ready.
  Contains a `Camera` symbol icon.
- **HDR Analyzer bar** (bottom): static label `HDR Analyzer:`, **HdrImpactBar**
  (`ProgressBar`), and **SceneTypeTextBlock** (scene-type output text).

### Expected initial state
On a machine with no usable camera, both apps initialize to the same state: blank
preview, both buttons **disabled**, HDR bar empty. So no control is expected to be
actuatable in either app — there is nothing that "responds in UWP but is dead in WinUI."
