# Lessons — UserInfo (UWP → WinUI 3)

**Outcome:** Score 100/100, builds ✓, runs ✓, 3/3 features pass. All parity/discrepancy
findings are environmental (blank WinUI screenshots, UWP CoreWindow not actuable) — not
migration defects. The only real friction was a **single failed build round** with two
distinct root causes, both fixed within ~5 turns.

## The two build blockers (both generalizable knowledge gaps)

### 1. `CS0104` DispatcherQueue / DispatcherQueuePriority ambiguity
- Error: `'DispatcherQueuePriority' is an ambiguous reference between
  'Microsoft.UI.Dispatching.DispatcherQueuePriority' and 'Windows.System.DispatcherQueuePriority'` (×5).
- Root cause: the file kept `using Windows.System;` (needed for the `Windows.System.User`
  / `UserWatcher` APIs that are the whole point of UserInfo) **and** added
  `using Microsoft.UI.Dispatching;`. Both namespaces expose `DispatcherQueue` and
  `DispatcherQueuePriority`.
- Fix: drop `using Microsoft.UI.Dispatching;` and the redundant priority arg — the
  `DispatcherQueue` instance is inherited from Page/Window, so
  `DispatcherQueue.TryEnqueue(() => ...)` resolves with no Dispatching using at all.
- Skill state: MIGRATION-PATTERNS.md scopes the CS0104 note to
  `Windows.UI.Xaml.* ↔ Microsoft.UI.Xaml.*` only; the `Windows.System ↔ Microsoft.UI.Dispatching`
  DispatcherQueue collision is **absent**. → skill-defect.

### 2. `WMC0909` Cannot resolve DataType on an `x:Bind` DataTemplate
- Errors: `WMC0909 Cannot resolve DataType local:Scenario`, then `WMC1111 DataTemplates
  containing x:Bind need a DataType`, then `WMC9999` internal error.
- Root cause: the SDK-sample scenario-list `ListBox` template used
  `<DataTemplate x:DataType="local:Scenario"><TextBlock Text="{x:Bind Title}"/>` but the
  `local:` prefix did not resolve to the CLR namespace where `Scenario` lives.
- Fix: point `local:` at Scenario's real namespace and keep `x:Bind`, **or** fall back to
  classic `{Binding Title}` (no compile-time DataType required). Agent chose `{Binding}`.
- Skill state: MIGRATION-PATTERNS.md attributes WMC0909/WMC1111/WMC9999 **only** to an
  orphaned code-behind (missing sibling `.xaml`); the `.xaml` was present here, so that
  guidance would have sent the agent down the wrong path. → skill-defect (misleadingly narrow).

## Non-issues (no skill change)
- 14 nullability warnings (CS86xx) from the scaffold's `<Nullable>enable</Nullable>` over
  SDK sample code written pre-nullable. Warnings only; build succeeded, score 100. Cosmetic.
- Blank WinUI screenshots / unactuable UWP CoreWindow — evaluation-environment caveats,
  out of scope for the migration skill.
