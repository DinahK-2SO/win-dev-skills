# Lessons — ActivitySensor (UWP→WinUI 3)

**Outcome:** score 88, builds ✓, runs ✓, 3/4 features pass, 1 partial (Background activity).

## Root cause of the only regression
`Scenario4_BackgroundActivity.ScenarioRegisterTask` is an `async void` handler that calls
`BackgroundExecutionManager.RequestAccessAsync()` — an out-of-process UWP background API that
**throws in WinUI 3 desktop**. With no try/catch, the exception is swallowed → the
"Register Task" button is present but **dead** (no status change), capping the feature at *partial*.

## Two generalizable takeaways
1. **`async void` event handlers swallow exceptions.** Any migrated UWP click handler that
   calls a WinRT API which is unsupported/throws on WinUI 3 desktop becomes a silently-dead
   control unless its body is wrapped in try/catch that surfaces the error to the UI. The
   existing "Defensive UI" rule only covers *page-init* blank screens, not handler-level dead controls.
2. **Out-of-process background tasks are unsupported.** `BackgroundExecutionManager.RequestAccessAsync()`,
   `TaskEntryPoint`-based components, and device triggers (`ActivitySensorTrigger`) throw in desktop.
   The inventory only flags `BackgroundTaskBuilder`, so the throwing call was never TODO-tagged, and
   PATTERNS.md#background-tasks gives no runtime-behavior warning.

## Tooling note
`unsupported-api-inventory.json` IBackgroundTask pattern misses `BackgroundExecutionManager` /
`RequestAccessAsync` → no TODO injected on the line that actually breaks at runtime.
