# Skill Defects — CameraVideoStabilization

## 1. Missing SystemMediaTransportControls replacement (absent)
- **Evidence:** `warning WUI0004: SystemMediaTransportControls.GetForCurrentView() is UWP-only`; MainPage.xaml.cs L88-95 `try { GetForCurrentView() } catch { null }`.
- **State:** absent from `#getforcurrentview` table.
- **Root cause:** table omits SMTC; inventory injected a TODO to the anchor but the anchor had no answer.
- **Fix:** add SMTC row → `ISystemMediaTransportControlsInterop.GetForWindow(hwnd)` + snippet.
- **Generalizes:** every UWP media playback/recording sample uses SMTC.

## 2. WUI0004 row mislabeled as SystemNavigationManager-only (wrong)
- **Evidence:** L584 hard-codes SystemNavigationManager; actual warning fired for SMTC.
- **Fix:** describe WUI0004 at the rule level ("any view-scoped GetForCurrentView()") and route to `#getforcurrentview` for the specific replacement.
- **Generalizes:** WUI0004 fires for whichever singleton the app uses.
