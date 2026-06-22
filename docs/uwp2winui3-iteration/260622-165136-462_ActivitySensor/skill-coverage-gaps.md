# Skill Coverage Gaps (present but unclear → WILL change skill) — ActivitySensor

### 1. Background-task migration: lifecycle override + manifest extension (Tier 3, sharpen existing section)
- **Evidence:** CS0115 `App.OnBackgroundActivated … no suitable method to override` (turn 36); CS0246 `BackgroundActivatedEventArgs` (turn 30); Appx register WARN `EntryPoint="Tasks.ActivitySensorBackgroundTask" without ActivatableClassId` (turn 48) and `extension is missing an EntryPoint … 0x80073CF6` (turn 51). Fixed turns 37/52.
- **Covered at:** `MIGRATION-PATTERNS.md` `## Background Tasks` (#background-tasks) + `## Application Lifecycle and Activation` — but only say "IBackgroundTask is not recommended, use BackgroundTaskBuilder". They omit the two concrete WinUI 3 failure modes.
- **Improvement:** spell out (1) delete the `OnBackgroundActivated` override, (2) remove the `windows.backgroundTasks` manifest extension, (3) guard `Register()` with try/catch.
- **Generalizes:** any UWP sample with in-process background tasks hits the same three errors.
