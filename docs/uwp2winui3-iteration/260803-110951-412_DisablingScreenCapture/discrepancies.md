# Parity Discrepancies — DisablingScreenCapture

UWP golden launched successfully (Release, PID 50228, window "Disabling Screen Capture C# sample").
Migrated WinUI 3 app built and launched (PID 83572). All three scenario frames rendered non-blank.

## Scenario 1 — Enabling screen capture — PASS
- Description text matches ("Screen capture allowed / By default, screen capture is allowed.").
- MediaPlayer video renders. 0 interactive controls in baseline. Structural + visual parity OK.

## Scenario 2 — Disabling screen capture — PASS (structural)
- Navigation highlights the correct nav item. MediaPlayer renders.
- 0 interactive controls in baseline; the automated gate passes.
- Note: the WinUI content pane still showed scenario 1's description text in the captured frame;
  however the UWP golden capture likewise did not switch its content pane for this scenario
  (title-driven nav artifact affecting both captures), so this is not counted as a WinUI-specific defect.

## Scenario 3 — Managing AppCapture — FAIL
- **Missing control:** the "Allow app capture" `ToggleSwitch` (AutomationId `AllowAppCaptureCheckBox`)
  present in the UWP golden is absent from the WinUI 3 UIA tree (0/1 coverage).
- **Dead behavior:** invoking `AllowAppCaptureCheckBox` produced no response in WinUI (0/1 live).
- **Missing output:** the UWP golden shows a green Status block ("Audio is not being captured. /
  Video is not being captured."); the WinUI capture shows no status output.
- **Wrong description text:** WinUI showed "Screen capture allowed / By default, screen capture is
  allowed." instead of the Managing-AppCapture description.
- The WinUI scenario-3 frame is effectively scenario 1's page — the scenario-specific content
  (toggle + status) did not load. This is a genuine functional regression, not a capture artifact.
