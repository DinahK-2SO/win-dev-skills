# Inclinometer — UWP → WinUI 3 Parity Rubric

Ground truth: the original UWP `Inclinometer` sample (SDK sample), 3 scenarios.
Machine has **no physical inclinometer sensor**, so every scenario legitimately shows
`No inclinometer found` / `No data` in **both** the UWP and WinUI apps. This is a
hardware-gated condition, applied equally to both — not a migration defect.

## Scenario 1 — Data events
- Controls: `Enable` (ScenarioEnableButton), `Disable` (ScenarioDisableButton),
  outputs `ScenarioOutput_X/Y/Z/YawAccuracy`, description `InputTextBlock`, shared status.
- Behavior: Enable registers a `ReadingChanged` listener; Disable stops it and stays
  disabled until Enable succeeds.

## Scenario 2 — Polling
- Controls: `Enable`, `Disable`, outputs X/Y/Z/YawAccuracy, description, shared status.
- Behavior: Enable polls `GetCurrentReading` on a timer; Disable stops it.

## Scenario 3 — Calibration
- Controls: `High`, `Approximate`, `Unreliable` radio buttons, description, shared status.
- Behavior: Selecting accuracy simulates sensor accuracy; `Unreliable` invokes the
  calibration bar.

## Grading
- **pass**: reachable non-empty page + ≥80% control coverage + no behavioral regression.
- **partial**: ≥40% coverage, or a control present but dead vs a responding UWP control.
- **fail**: blank/unreachable or <40% coverage.
- **score** = round(100 · (pass + 0.5·partial) / total).
