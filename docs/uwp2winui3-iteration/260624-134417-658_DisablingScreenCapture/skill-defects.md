# Skill defects — DisablingScreenCapture (WILL change skill)

## 1. No mapping for UWP screen-capture protection (`IsScreenCaptureEnabled`)
- **Evidence:** `error CS1061: 'AppWindow' does not contain a definition for 'IsScreenCaptureEnabled'` (session-log ~2243). Agent then used Win32 `SetWindowDisplayAffinity(hwnd, WDA_EXCLUDEFROMCAPTURE/WDA_NONE)`.
- **Skill search:** grep `ScreenCapture|DisplayAffinity|WDA_|content protect` → **0 hits** (absent).
- **Root cause:** GetForCurrentView/windowing tables map `ApplicationView` → `AppWindow`, but the capture-protection flag isn't an AppWindow member; it needs a Win32 HWND call.
- **Fix:** New `screen-capture` anchor in MIGRATION-PATTERNS.md (`SetWindowDisplayAffinity` + WDA constants + HWND via `WindowNative.GetWindowHandle`), a clarifying table row, and an `IsScreenCaptureEnabled` route in `unsupported-api-inventory.json`.
- **Generalizes:** Content protection / capture prevention (privacy, DRM, secure fields) recurs across UWP apps; the AppWindow dead-end is identical everywhere.
