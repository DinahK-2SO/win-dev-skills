# Lessons — DisablingScreenCapture (index 0)

Score 67 (2/3 pass). Only functional failure: **Scenario 3 "Managing AppCapture"**.

## Root cause
`AppCapture.GetForCurrentView()` (Scenario3_AppCapture.xaml.cs:37) is a UWP-only per-view
accessor. It compiles but throws at runtime under WinUI 3 desktop (analyzer **WUI0004**).
The migration agent:
1. Left the call verbatim.
2. Added a **wrong** comment claiming "the static AppCapture instance shares the same
   underlying object" (no such thing).
3. Wrapped it in a `try/catch` whose catch only calls `NotifyUser(...)` — silently
   swallowing the failure.

Result: the `AllowAppCaptureCheckBox` ToggleSwitch and the audio/video Status block were
non-functional (0/1 control coverage, 0/1 live), and the scenario page effectively showed
scenario-1 content.

## Why the agent slipped
The skill's `getforcurrentview` replacement table only covers **windowing/view** singletons
(ApplicationView, UIViewSettings, DisplayInformation, SystemNavigationManager). It offers no
recipe for **feature-service** WinRT singletons like `AppCapture` whose correct WinUI 3 fix
is **HWND-based COM interop**. The WUI0004 row also only names `SystemNavigationManager`.

## Reusable takeaways
- `GetForCurrentView()` on a *feature service* (not just a view/window type) → re-acquire via
  HWND-based COM interop against the app window.
- **Anti-pattern:** never silence a UWP-only runtime call with a notifying `try/catch`; that
  ships a dead feature and hides the WUI defect. Fix the API, don't swallow it.
