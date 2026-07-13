# Discrepancies — AppServices

The migrated WinUI 3 app faithfully replicates the original UWP app. Both baseline scenarios are
present, correctly laid out, and every control is wired up and behaviorally responsive
(structural coverage 3/3 and 5/5; actions 1/1 and 3/3 live). **No missing controls, no dead
controls, no incorrect outputs.**

## Observed differences (all additive — none are regressions)

| Scenario | Type | Severity | Detail |
|---|---|---|---|
| Open/Close Connection | enhancement | none | Adds a green Status banner ("App service responded with a result") below the original Result output. Original controls intact; Result still shows the generated value. |
| Keep Connection Open | enhancement | none | Adds a Status banner reflecting state, e.g. red "You need to open a connection before trying to generate a random number." — matches the UWP handler's guard logic, surfaced more visibly. |
| Navigation shell | superset | none | WinUI nav lists a 3rd scenario "3) Show Package Family Name" (from shared UWP source) that the UWP client nav did not register. Superset of the 2-scenario baseline, not a missing feature. |

## UWP capture note

The original UWP app launched (`uwp-app-runner` `ok:true`, PID 2956) and rendered real content; a
golden of Scenario 1 was captured from its CoreWindow (`notes/uwp_now.png`). The legacy UWP app
exposed **no UIA content subtree** and rejected synthetic input in this non-interactive session, so
per-scenario UIA-driven navigation of the golden was not possible. Ground truth was taken from the
live Scenario-1 frame plus the UWP source XAML/handlers. This is an environmental capture
limitation of the legacy app, not a migration defect, and does not affect the structural grade
(which uses the source-derived checklist as the baseline).
