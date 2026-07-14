# Skill coverage gaps — ActivitySensor (WILL change skill)

## 1. `async void` event handlers swallow exceptions → dead controls
- **Problem:** A migrated `async void` click handler calling a WinRT API that throws on WinUI 3 desktop swallows the exception and leaves a present-yet-dead control (no UI feedback), capping the feature at partial.
- **Evidence:** migration-score.json Background activity note — "invoked, but produced no output/status change; newTokens 0". `Scenario4_BackgroundActivity.xaml.cs:68 async private void ScenarioRegisterTask(...)` has no try/catch around the throwing `await`.
- **Covered at:** SKILL.md "Defensive UI for device-dependent features" (lines 196–202) — but scoped only to page **init** blank windows.
- **Why missed:** under-emphasized — the rule doesn't extend to event handlers.
- **Improvement:** broaden the rule to require try/catch around `async void` event-handler bodies, routing the exception to the same status/notify surface used on success.
- **Generalizes:** UWP samples are built almost entirely from `async void` handlers calling WinRT APIs; many throw on desktop, so handler-level defensive UI prevents dead-control regressions across nearly every scenario.
