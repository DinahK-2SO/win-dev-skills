# Skill defects (will change skill)

## 1. Suspend/resume lifecycle absent from the skill
- **Problem:** UWP `Application.Suspending`/`Resuming` carried into `App.xaml.cs` →
  `CS1061 'App' does not contain a definition for 'Suspending'` (session-log turn 16).
- **Skill state:** **absent.** `MIGRATION-PATTERNS.md#lifecycle` covers only activation
  (`OnLaunched`/`OnActivated`/`AppInstance`); suspend/resume appears nowhere.
- **Root cause:** `Microsoft.UI.Xaml.Application` has no suspend/resume events; the skill
  never says so or gives the `Window.Closed` replacement.
- **Fix:** add suspend/resume guidance to the `lifecycle` anchor **and** seed an inline
  TODO via `unsupported-api-inventory.json` (anchor `lifecycle`) so the agent is routed
  before it builds.
- **Generalizes:** present in every standard-template UWP app (SuspensionManager); recurs
  across stateful UWP→WinUI 3 migrations.
