# OCR C# sample — Parity Rubric

Two scenarios derived from the UWP source (`OCR/cs`). Each scenario is worth equal
weight; final score = `round(100 * (pass + 0.5*partial) / 2)`.

## Scenario 1 — OCR image file (`OcrFileImage`)
- **Controls:** `UserLanguageToggle` (ToggleSwitch), `PreviewImage` (Image), language
  `ComboBox`, and the load/sample/extract command-bar actions.
- **Action to actuate:** toggle `UserLanguageToggle` and confirm a visible response.
- **Output:** status text (`StatusBlock`).
- **Pass:** reachable, all checklist controls present, toggle responds.

## Scenario 2 — OCR captured image (`OcrCapturedImage`)
- **Controls:** `PreviewImage` (Image); camera capture button; status text.
- **Action:** camera capture (hardware-gated).
- **Output:** status text (`StatusBlock`).
- **Pass:** reachable, checklist control present, and — on a machine without a camera —
  a visible defensive fallback (e.g. "No camera device!") rather than a blank page.
