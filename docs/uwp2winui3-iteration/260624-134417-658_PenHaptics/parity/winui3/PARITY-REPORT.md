# Parity Report — PenHaptics C# Sample

Generated 2026-07-08T13:26:43.3062863+08:00 by Compare-Parity.ps1.

**Parity score: 60 / 100**  ·  pass=3 partial=0 fail=2  ·  5 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Ink Canvas Tactile Feedback | FAIL | 0/1 | — | 01_Ink_Canvas_Tactile_Feedback.png | Missing 1/1 control(s): InkCanvas (appInkCanvas) |
| 2 | Query Tactile Feedback Support | PASS | n/a | — | 02_Query_Tactile_Feedback_Support.png |  |
| 3 | Inking Feedback | PASS | n/a | — | 03_Inking_Feedback.png |  |
| 4 | Interaction Feedback | FAIL | 0/1 | 0/1 live | 04_Interaction_Feedback.png | Missing 1/1 control(s): Button "Send Interaction Feedback" |
| 5 | Inking and Interaction Feedback | PASS | n/a | — | 05_Inking_and_Interaction_Feedback.png |  |

## Scenarios needing work

### Scenario 1 — Ink Canvas Tactile Feedback  [FAIL]

- Missing 1/1 control(s): InkCanvas (appInkCanvas)
- Controls not found in the WinUI 3 UIA tree:
  - InkCanvas (appInkCanvas)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Ink_Canvas_Tactile_Feedback.png` against the baseline.

### Scenario 4 — Interaction Feedback  [FAIL]

- Missing 1/1 control(s): Button "Send Interaction Feedback"
- Controls not found in the WinUI 3 UIA tree:
  - Button "Send Interaction Feedback"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/04_Interaction_Feedback.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
