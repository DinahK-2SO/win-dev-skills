# Parity Rubric — CameraGetPreviewFrame

Single-page sample. The migrated WinUI 3 app must reproduce the one scenario below.

## Scenario 1 — CameraGetPreviewFrame

| Control | Type | Expected behavior |
|---|---|---|
| GetPreviewFrameAsync | Button | Captures a preview frame from the live camera preview. **Hardware-gated** — disabled until the preview starts; with no camera it remains disabled. |
| Show frame | CheckBox | Toggles display of the captured frame. |
| Green effect | CheckBox | Toggles a green tint on the captured frame. |
| Save frame | CheckBox | Toggles saving the captured frame to file. |

### Action to actuate
- **GetPreviewFrameAsync** (Button): produces a visible frame/FrameInfo update **when a camera is present**. On this machine there is no camera, so the button is disabled and produces no response — in both the UWP original and the WinUI 3 migration. A dead button here is therefore **not** a regression.
