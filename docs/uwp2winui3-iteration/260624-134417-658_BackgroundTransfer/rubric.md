# UWP→WinUI 3 Parity Rubric — BackgroundTransfer

Ground truth: the original UWP **BackgroundTransfer C#** sample (7 scenarios), launched
in Release via `uwp-app-runner` (PID 20512, windowTitle "BackgroundTransfer C#"). Feature
list derived from the UWP source via `Extract-UwpFeatureChecklist.ps1`.

Each scenario is graded **pass / partial / fail** on:

1. **Structural coverage** — every UWP control (by AutomationId / name / label) is present
   in the migrated WinUI 3 app's UIA tree, with real layout bounds.
2. **Visual fidelity** — the migrated page reproduces the UWP layout, labels and default
   values.
3. **Behavioral fidelity** — each action control does what the UWP handler did (a control
   that responds in the UWP golden but is dead in WinUI is at best `partial`).

Verdict rule: `pass` = full structural coverage + faithful layout/defaults + no behavioral
regression vs UWP; `partial` = recognizable but a real control/behavior gap; `fail` =
scenario dropped, blank, or non-functional.

## Scenarios (from UWP source, in order)

| # | Scenario | Key controls | Actions |
|---|----------|--------------|---------|
| 1 | File Download | remote address, local file name, 2 download buttons, Pause/Resume/Cancel All, output | Start Download, Start High Priority Download, Pause All, Resume All, Cancel All |
| 2 | File Upload | remote address, file name, Start Upload, Start Multipart Upload, Cancel All, output | Start Upload, Start Multipart Upload, Cancel All |
| 3 | Completion Notifications | 2 start buttons, output | toast, tile |
| 4 | Completion Groups | start button, output | Start ten downloads |
| 5 | Random Access Downloads | address, file name, Start/Pause/Resume/Seek, image/output | Start, Pause, Resume, Seek |
| 6 | Recoverable Errors | address, file name, "Recover from expired URL" checkbox, Start, ReauthorizeDialog (NumericPin TextBox) | Start |
| 7 | Download Reordering | address, file name, Start Download, pending-transfers ListView with per-item "Make Current" | Start Download, Make Current |

## Measurement caveats (environment)

- The UWP **CoreWindow UIA tree is not externally enumerable** on this box (only a single
  Pane is exposed; `winapp ui search` returns 0). Title-driven navigation and per-control
  actuation of the *original* app were therefore impossible — the UWP golden is the single
  initial frame (scenario 1), captured 7× identically. No UWP behavioral baseline exists.
- The WinUI 3 app renders via **DirectComposition**, which `winapp ui screenshot`
  (PrintWindow) captures as blank; this session also has **no interactive desktop**
  (`CopyFromScreen` → "handle is invalid"), so true screen capture of the WinUI app was not
  possible. WinUI visual/structural fidelity was therefore verified through the **UIA tree**
  (real control bounds, text and default values), which is reliable and matches the UWP.
