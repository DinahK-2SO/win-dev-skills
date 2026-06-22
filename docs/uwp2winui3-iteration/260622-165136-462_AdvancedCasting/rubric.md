# Rubric — AdvancedCasting (ScreenCasting)

Ground-truth feature checklist derived from the UWP source via
`Extract-UwpFeatureChecklist.ps1` (deterministic instrument, used as-is).

| # | Scenario | Controls | Actions | Outputs |
|---|----------|----------|---------|---------|
| 1 | DIAL Receiver Windows Universal Application | 0 | 0 | StatusBorder, StatusBlock |

**Scoring:** `score = round(100 * (pass + 0.5*partial) / features_total)`.
A feature whose control responds in the UWP golden but is dead in WinUI is at
best `partial`. A non-launchable migration scores every feature `fail`.
