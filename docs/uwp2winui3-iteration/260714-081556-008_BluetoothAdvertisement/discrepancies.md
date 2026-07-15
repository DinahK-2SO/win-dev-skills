# Discrepancies — BluetoothAdvertisement (score 75)

Structural parity: **PASS** (100% control coverage, non-blank frames).
Behavioral parity: **2 regressions**, both in the background scenarios.

| # | Feature | Status | Root cause |
|---|---------|--------|-----------|
| 1 | Scenario 1 Foreground watcher | pass | — |
| 2 | Scenario 2 Foreground publisher | pass | — |
| 3 | Scenario 3 Background watcher | **partial** | Dead Run: in-process background-task model has no WinUI 3 equivalent (no `App.OnBackgroundActivated`); registration fails silently. |
| 4 | Scenario 4 Background publisher | **partial** | Dead Run: same in-process background-task defect. |

## Suspected skill gaps
- `MIGRATION-PATTERNS.md > Background Tasks` documents only the **out-of-process** model
  (string `TaskEntryPoint`). The **in-process** variant used here (`TaskEntryPoint`
  omitted + `App.OnBackgroundActivated`) is undocumented → **skill-defect**.
- `Validate-UwpMigration.ps1` background-task check passes as long as a
  `windows.backgroundTasks` extension exists; it was present, so the dead in-process
  control slipped through → **tooling/coverage gap**.
