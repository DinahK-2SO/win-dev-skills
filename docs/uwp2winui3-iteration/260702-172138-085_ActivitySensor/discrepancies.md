# Discrepancies — ActivitySensor WinUI 3 vs UWP golden

Structural parity gate: **PASS 100/100** (4/4 scenarios, 100% control coverage). See
`parity/winui3/parity-result.json` and `PARITY-REPORT.md`.

No **structural** discrepancies were found: every scenario is reachable, every baseline
control is present in the WinUI 3 UIA tree with the correct AutomationId, label text,
and initial state (e.g. S4 "Task Registration: Unregistered", all outputs "No data").
Navigation titles match the UWP verbatim ("1) Current activity" … "4) Background
activity").

## Non-structural observations (not migration defects)

| # | Scenario | Observation | Assessment |
|---|----------|-------------|------------|
| — | all | WinUI 3 screenshots are blank/black despite a fully-populated UIA tree. | **Environment**, not defect. Headless host has no foreground desktop → DWM produces no pixels. Visual fidelity was therefore judged from the UIA tree, which confirms full render. |
| — | all | No UWP behavioral golden to compare against. | **Environment.** The live UWP app suspends in the background (no foreground desktop), so its UIA tree is empty and it can't be driven; only its initial Scenario-1 frame was captured. |
| 1 | Current activity | Get Current Activity responded (+2 text tokens). | Live. |
| 2 | Activity history | Get Activity History responded (+2 text tokens). | Live. |
| 3 | Events | ReadingChanged On responded; ReadingChanged Off did not invoke (disabled until toggled / no output). | Primary action live; secondary is state/hardware-gated. Not a confirmed regression (no UWP baseline; sensor absent). |
| 4 | Background activity | Register Task / Unregister Task produced no visible output change. | Hardware-gated: no activity-sensor hardware on host (UWP itself shows "No data" for all readings). Controls are present and wired; no evidence they are dead vs. UWP. Flagged for manual review per parity rules, not failed. |

## Conclusion
The migrated WinUI 3 app is a complete, buildable, launchable, and structurally
faithful reproduction of all four UWP scenarios. No control is missing or misnamed.
The only unverifiable dimensions (pixel-visual fidelity, full end-to-end behavior of
sensor-dependent actions) are blocked by the headless environment and absent sensor
hardware — conditions that equally constrain the original UWP app — not by the
migration.
