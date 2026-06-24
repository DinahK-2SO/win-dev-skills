# Parity Rubric — Accelerometer C# Sample

Ground truth: original UWP app **launched successfully** (Release/.NET Native, pid 27992,
window title "Accelerometer C# Sample"). Six scenarios, scored against the migrated WinUI 3 app.

| # | Scenario | Controls | Actions | Expected output |
|---|----------|----------|---------|-----------------|
| 1 | Choose accelerometer | ComboBox (ReadingTypeComboBox) | — | Selected reading type drives other scenarios |
| 2 | Data events | Enable / Disable buttons | Enable, Disable | X/Y/Z text updates on ReadingChanged |
| 3 | Shake events | Enable / Disable buttons | Enable, Disable | Shake count text |
| 4 | Polling | Enable / Disable buttons | Enable, Disable | X/Y/Z text polled on a timer |
| 5 | Orientation change | Enable / Disable buttons | Enable, Disable | X/Y/Z text relative to display orientation |
| 6 | Data events batching | Enable / Disable buttons | Enable, Disable | X/Y/Z text with report latency / batching |

Pass = reachable + ≥80% control coverage and live behaviour matching UWP.
Partial = reachable + ≥40% coverage, or a control present but dead vs UWP.
Fail = unreachable / blank / <40% coverage.
