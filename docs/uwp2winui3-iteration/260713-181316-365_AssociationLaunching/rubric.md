# Parity Rubric — AssociationLaunching (UWP → WinUI 3)

Ground-truth feature list derived from the UWP source (`Extract-UwpFeatureChecklist.ps1`).
Each scenario is graded on: (a) reachability / non-blank render, (b) structural control
coverage vs. the checklist, (c) behavioral fidelity of each action vs. the original handler.

| # | Scenario | Controls | Actions | Expected behavior of actions |
|---|----------|----------|---------|------------------------------|
| 1 | Launching a file | 6 | 5 | `Launch default handler` / `Launch with warning` → in-app status text; `Launch Open With` → system Open-With dialog; `Pick and launch` / `Launch with view preference` → FileOpenPicker then status text |
| 2 | Launching a URI | 6 | 4 | `Launch default handler` / `Launch with warning` / `Launch with view preference` → in-app status text; `Launch Open With` → system Open-With dialog |
| 3 | Receiving a file | 3 | 3 | `Create test file` / `Create test file with no file extension` → create file in Pictures + open Explorer folder (no in-app text); `Remove test files` → delete files (no in-app text) |
| 4 | Receiving a URI | 0 | 0 | Display-only page; content shown when app is activated via a URI |

**Verdict thresholds:** pass = reachable + ≥80% control coverage + actions behave as source;
partial = reachable + ≥40% coverage or a control present-but-dead vs. UWP; fail = blank /
unreachable / <40% coverage / every frame blank.
