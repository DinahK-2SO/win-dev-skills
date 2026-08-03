# Discrepancies — CameraVideoStabilization

- **Score:** 100 (builds=true, runs=true). 3/3 controls, 0 behavioral regressions.
- **Only real issue** is latent, visible in build output not the score: SMTC path dead.

## Requirements
- [pass] CameraVideoStabilization page (PreviewControl, VsToggleButton, VideoButton) —
  full structural + behavioral parity (buttons hardware-gated in both apps).

## Visual
- WinUI adds a defensive "no camera device" fallback where UWP shows a blank preview
  (improvement, not a defect).

## Latent defect (build-level)
- `SystemMediaTransportControls.GetForCurrentView()` migrated as `try/catch -> null`
  (WUI0004). Dead on any camera-equipped host. See skill-defects.md.
