# Parity Rubric — Camera resolution C# sample (CameraResolution)

Ground truth: original UWP app, launched in Release (PID 24736, window
"Camera Resolution C# Sample"). Each scenario is graded on structural control
coverage **and** behavioral fidelity (does each action control respond as it does
in the UWP golden).

| # | Scenario | Controls (target) | Action | Pass criteria |
|---|----------|-------------------|--------|---------------|
| 1 | Change camera preview settings | Preview Settings (ComboBox), Initialize Camera (Button) | Initialize Camera | All controls present; Initialize Camera updates the Status output as in UWP |
| 2 | Change preview and photo settings | Preview Settings (ComboBox), Photo Settings (ComboBox), Initialize Camera (Button) | Initialize Camera | All controls present; Initialize Camera updates Status output |
| 3 | Match aspect ratios | Preview Settings (ComboBox), Video Settings (ComboBox), Initialize Camera (Button) | Initialize Camera | All controls present; Initialize Camera updates Status output |

Verdict scale: pass = reachable + ≥80% control coverage + action responds as UWP;
partial = reachable + ≥40% coverage OR action dead vs UWP; fail = blank/unreachable
or <40% coverage.
