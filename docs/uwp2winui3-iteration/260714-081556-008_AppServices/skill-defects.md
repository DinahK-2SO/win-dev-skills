# Skill Defects — AppServices (WILL change skill)

## 1. AppService family has zero coverage (absent)
- **Problem:** No pattern for AppServiceConnection (client), the in-process provider, or
  the `windows.appService` manifest extension. Agent migrated it all unaided (turns 30-38).
- **Search:** grep for `AppService` / `windows.appService` / `uap3:AppService` in the
  skill → **no matches**.
- **Fix:** Add an `app-services` anchor to MIGRATION-PATTERNS.md; add
  `AppServiceConnection|AppServiceTriggerDetails` to `unsupported-api-inventory.json`
  (adaptable → anchor `app-services`) so the bootstrap injects a routing TODO.
- **Generalizes:** App services are a standard UWP IPC mechanism; every app that exposes
  or consumes one has this same client+provider+manifest triad.

## 2. background-tasks advice is wrong for app-service providers (wrong)
- **Problem:** `#background-tasks` blanket-says "abandon IBackgroundTask, use
  BackgroundTaskBuilder / Task Scheduler." For an app-service provider that is **wrong** —
  `IBackgroundTask` + `AppServiceTriggerDetails` is the only valid host. Agent had to
  override the skill (turn 38).
- **Wrong text:** "IBackgroundTask / BackgroundTaskRegistration are not the recommended
  model. Use the WinAppSDK BackgroundTaskBuilder ... or Task Scheduler."
- **Fix:** Add a carve-out: if `TriggerDetails` is an `AppServiceTriggerDetails`, keep
  `IBackgroundTask` and see `#app-services`; only non-app-service tasks move to
  BackgroundTaskBuilder.
- **Generalizes:** Every app-service provider is an IBackgroundTask; the blanket advice
  misroutes all of them.
