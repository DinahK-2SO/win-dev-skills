# Skill defects — UserInfo (WILL change skill)

Both items are real build blockers from the single failed build round (session-log turn 47),
both generalize beyond UserInfo.

## 1. CS0104 DispatcherQueue / DispatcherQueuePriority ambiguity (Windows.System ↔ Microsoft.UI.Dispatching)
- **Evidence:** turn 47 — `error CS0104: DispatcherQueuePriority is an ambiguous reference
  between Microsoft.UI.Dispatching.DispatcherQueuePriority and Windows.System.DispatcherQueuePriority` (×5).
- **Skill state:** absent. The CS0104 note (MIGRATION-PATTERNS.md line 28) is scoped to
  `Windows.UI.Xaml.* ↔ Microsoft.UI.Xaml.*`; the threading section shows the priority
  overload with no ambiguity warning.
- **Fix:** add a warning in the threading section + broaden the CS0104 note. Prefer not
  importing `Microsoft.UI.Dispatching` (inherited `DispatcherQueue` resolves `TryEnqueue`),
  or fully-qualify.
- **Generalizes:** every app that dispatches to the UI thread AND uses a `Windows.System.*`
  WinRT API keeps `using Windows.System;` and hits this.

## 2. WMC0909 / WMC1111 from an x:Bind DataTemplate whose x:DataType can't resolve
- **Evidence:** turn 47 — `MainPage.xaml(25,30): WMC0909 Cannot resolve DataType local:Scenario`,
  `WMC1111 DataTemplates containing x:Bind need a DataType`, `WMC9999`.
- **Skill state:** wrong/misleading. Line 804 presents these codes as symptoms of an
  **orphaned code-behind** (missing `.xaml`); here the `.xaml` was present. The x:Bind
  section (line 927) only covers `XLS0414`/`MC3074`.
- **Fix:** document the second cause under the x:Bind section: an unresolvable `x:DataType`
  in a DataTemplate. Resolve the xmlns prefix to the item type's real namespace and keep
  x:Bind, or fall back to `{Binding}`.
- **Generalizes:** the SDK sample scenario-list pattern (used across the whole sample
  family) binds the ListBox this way; recurs for any migrated x:Bind DataTemplate.
