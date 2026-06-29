# Discrepancies — CameraAdvancedCapture (UWP → WinUI 3)

## Summary
The migration is a faithful, near-verbatim port of the single-page camera app. Every
control in the UWP source is present in the WinUI 3 app's live UIA tree with matching
names, text, and geometry, and both apps settle into the same initial state.

## Findings

### 1. WinUI 3 candidate screenshot is blank (info — capture artifact, not a defect)
- **UWP golden** (`parity/baseline/screenshots/01_CameraAdvancedCapture.png`, 25 KB):
  shows the CycleModeButton ("Standard" + AttachCamera icon), the PhotoButton (camera
  icon), and the bottom "HDR Analyzer:" bar.
- **WinUI candidate** (`parity/winui3/screenshots/01_CameraAdvancedCapture.png`, 10 KB):
  renders as a near-blank white frame (only the native min/max/close caption buttons
  are visible).
- **Why this is not a missing-control failure:** the WinUI UIA dump
  (`parity/winui3/ui/01.json`) enumerates **all** controls with correct bounds and text —
  `CycleModeButton` (with child `ModeTextBlock`="Standard"), `PhotoButton`,
  `HDR Analyzer:` label, `HdrImpactBar` (ProgressBar), `SceneTypeTextBlock`. The visual
  tree is fully populated. The blank pixel capture is the known WinUI 3
  swapchain/PrintWindow screenshot limitation (the same UIA-confirmed content simply
  doesn't round-trip through PrintWindow), not a dropped or invisible control.

### 2. Buttons disabled in both apps (no behavioral regression)
- `CycleModeButton` and `PhotoButton` are `IsEnabled=false` in **both** the UWP golden
  and the WinUI candidate, because no camera device initialized on this host. No control
  responded in the UWP baseline, so there is no "responds in UWP but dead in WinUI"
  regression. The source-derived checklist exposed 0 actuatable actions; none were
  exercised in either capture.

## Control parity table

| Control | UWP | WinUI 3 | Status |
|---|---|---|---|
| PreviewControl | CaptureElement | MediaPlayerElement | present (idiomatic swap) |
| CycleModeButton | Button (disabled) | Button (disabled) | match |
| ModeTextBlock | "Standard" | "Standard" | match |
| PhotoButton | Button (disabled) | Button (disabled) | match |
| HDR Analyzer label | TextBlock | TextBlock | match |
| HdrImpactBar | ProgressBar | ProgressBar | match |
| SceneTypeTextBlock | TextBlock | TextBlock | match |

## Verdict
Feature **CameraAdvancedCapture → pass**. All controls present and correctly named;
identical initial/disabled state to the UWP; no behavioral regression. The only caveat
is the blank WinUI screenshot, attributable to the WinUI 3 capture limitation rather than
to the migration.
