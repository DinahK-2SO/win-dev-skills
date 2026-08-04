# Lessons — DisplayOrientation (index 1)

## Failed API
- **`DisplayInformation.GetForCurrentView()`** throws on WinUI 3 desktop
  (`GetForCurrentView must be called on a thread associated with a CoreWindow`) — no CoreWindow exists.
  **Fix:** `Microsoft.Graphics.Display.DisplayInformation.CreateForWindowId(windowId)`, where
  `windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(WindowNative.GetWindowHandle(App.MainWindow))`.
  This exposes `NativeOrientation` / `CurrentOrientation` and works on desktop.

## Doc error (skill)
- `MIGRATION-PATTERNS.md #getforcurrentview` maps `DisplayInformation.GetForCurrentView()` **only** to
  `XamlRoot.RasterizationScale` / `GetDpiForWindow` (DPI only), implying no orientation replacement.
  Wrong: the WinApp SDK `DisplayInformation.CreateForWindowId` is the true replacement and carries all members.

## Dev-agent struggle
- Agent knew `GetForCurrentView()` fails on desktop (cited the anchor) but had no working alternative, so it
  shipped a `try/catch` printing the raw exception → orientation output dead → feature scored **partial**.
  Preventable by correcting the mapping table + adding a code snippet.

## Special handling
- `CreateForWindowId` must run on a thread with a running `DispatcherQueue`; cache the instance and
  de-register its events.
