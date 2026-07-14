# Skill defects — ActivitySensor (WILL change skill)

## 1. Out-of-process background APIs throw in desktop, unflagged & undocumented
- **Problem:** `BackgroundExecutionManager.RequestAccessAsync()` (+ `TaskEntryPoint` components, device triggers like `ActivitySensorTrigger`) throw at runtime in WinUI 3 desktop. The migrated "Register Task" handler kept `RequestAccessAsync()` and became a dead control.
- **Evidence:** session-log.txt:656 keeps the call verbatim; migration-score.json Background activity = partial, `winui_responded=false`. The only injected TODO landed on the `BackgroundTaskBuilder` line, not the throwing call.
- **Skill state:** absent. `unsupported-api-inventory.json` matches `BackgroundTaskBuilder` but not `BackgroundExecutionManager`/`RequestAccessAsync`; `MIGRATION-PATTERNS.md#background-tasks` names the replacement builder but never warns the legacy call throws.
- **Fix:** extend the inventory pattern to match `BackgroundExecutionManager`/`RequestAccessAsync` (inject a TODO on the throwing line) + add a runtime-behavior warning to PATTERNS#background-tasks (guard in try/catch, surface a status, or move to in-process builder).
- **Generalizes:** every UWP app using out-of-process background tasks calls `RequestAccessAsync()` before registering; it throws on desktop regardless of scenario.
