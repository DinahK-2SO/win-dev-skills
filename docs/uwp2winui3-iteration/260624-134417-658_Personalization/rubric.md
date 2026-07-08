# Rubric — Lock screen personalization C# sample (scenario: Personalization)

Derived from the UWP source and used to grade the migrated WinUI 3 app.

## Scenario 1 — Pick and set lock screen image
- **Page class:** `SetLockScreenImage`
- **Controls (structural, must be present):**
  - `PickAndSetButton` (Button, label "Pick and set lock screen image")
  - `LockScreenImage` (Image)
- **Action (behavioral, must respond like UWP):**
  - Click `PickAndSetButton` → opens a file open picker; on selection sets the lock
    screen image and shows the selected image + file name.
- **Output elements:** `InputTextBlock1`, `StatusBorder`, `StatusBlock`

## Grading
- **pass** — control present in UIA tree AND behaves like the UWP handler.
- **partial** — present but dead (responds in UWP, not WinUI) or visually degraded.
- **fail** — missing/unreachable/crashing scenario.
- `score = round(100 * (pass + 0.5*partial) / features_total)`
