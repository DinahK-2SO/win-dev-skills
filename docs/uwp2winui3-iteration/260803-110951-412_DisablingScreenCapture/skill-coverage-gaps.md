# Skill Coverage Gaps — DisablingScreenCapture

## 1. GetForCurrentView() table scoped to windowing types only (under-emphasized)
- **Evidence:** WUI0004 on `AppCapture.GetForCurrentView()`; scenario 3 `fail` (dead toggle + status).
- **Covered at:** `MIGRATION-PATTERNS.md #getforcurrentview` + WUI0004 row.
- **Why missed:** table lists only 4 view/window singletons; reads as exhaustive, no recipe for a **feature-service** singleton like `AppCapture`.
- **Fix:** add a general rule — WinRT feature-service `GetForCurrentView()` accessors re-acquire via **HWND-based COM interop** (mirror the Pickers/Win32-surfaces `InitializeWithWindow` pattern). Broaden WUI0004 row beyond `SystemNavigationManager`.
- **Generalizes:** many WinRT services expose `GetForCurrentView()` beyond the four view types.

## 2. Silencing UWP-only calls with try/catch (not prominent)
- **Evidence:** `Scenario3_AppCapture.xaml.cs:35-44` — throwing call wrapped in a catch that only `NotifyUser`s.
- **Covered at:** "Treat every WUI000d line as a defect" intro.
- **Fix:** explicit anti-pattern note — never swallow a UWP-only API in a notifying try/catch; fix the API instead.
- **Generalizes:** swallow-and-notify is a framework-agnostic shortcut that ships dead features on any unsupported API.
