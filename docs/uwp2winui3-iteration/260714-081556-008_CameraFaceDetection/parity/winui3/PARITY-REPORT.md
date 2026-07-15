# Parity Report — CameraFaceDetection

Generated 2026-07-15T22:09:07.2930573+00:00 by Compare-Parity.ps1.

**Parity score: 50 / 100**  ·  pass=0 partial=1 fail=0  ·  1 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | CameraFaceDetection | PARTIAL | 3/5 | 0/3 live | 01_CameraFaceDetection.png | Missing 2/5 control(s): CaptureElement (PreviewControl); Canvas (FacesCanvas) |

## Scenarios needing work

### Scenario 1 — CameraFaceDetection  [PARTIAL]

- Missing 2/5 control(s): CaptureElement (PreviewControl); Canvas (FacesCanvas)
- Controls not found in the WinUI 3 UIA tree:
  - CaptureElement (PreviewControl)
  - Canvas (FacesCanvas)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_CameraFaceDetection.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
