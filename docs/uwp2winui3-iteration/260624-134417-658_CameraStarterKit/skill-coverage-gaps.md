# Skill coverage gaps — CameraStarterKit (iter 0)  → WILL change skill

## G1 — Application.Suspending / Resuming removal not stated in lifecycle section
- **Covered at:** PATTERNS.md `#lifecycle` (OnLaunched/activation only).
- **Why missed:** under-emphasized — the section never says the page-level
  Suspending/Resuming events are gone.
- **Evidence:** CS1061 at session-log TURN 34; ~7 turns to unwind (TURN 35-41).
- **Improvement:** add one explicit line — `Microsoft.UI.Xaml.Application` has no
  Suspending/Resuming; delete the subscriptions + handlers; gate resource pause/resume on
  `Window.Activated` + `AppWindow.IsVisible`.
- **Generalizes:** suspend/resume resource management is a universal UWP pattern
  (camera, media, file/network), so every resource-owning page hits this CS1061.
