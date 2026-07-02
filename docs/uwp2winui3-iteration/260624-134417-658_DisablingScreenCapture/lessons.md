# Lessons — DisablingScreenCapture (UWP → WinUI 3)

Final score: **100/100** (3/3 features pass). No parity defects; the app built and ran.
But the build log shows two generalizable friction points the skill can prevent.

## Helpful tools
- **Inline TODO injection** (`Initialize-UwpMigration.ps1`) gave the agent an exact
  worklist of UWP-only calls to convert.
- **`dotnet build` diagnostics** (CS1061, WMC0909/WMC1111) pinpointed each bad API guess.

## Failed API / errors
- `AppWindow.IsScreenCaptureEnabled` → **CS1061** (no such member). UWP
  `ApplicationView.IsScreenCaptureEnabled` has **no AppWindow equivalent**. Correct
  mapping: Win32 `SetWindowDisplayAffinity(hwnd, WDA_EXCLUDEFROMCAPTURE / WDA_NONE)`.
- `DataTemplate x:DataType="local:Scenario"` + `{x:Bind}` → **WMC0909 / WMC1111**
  ("Cannot resolve DataType" / "need a DataType"). Fixed by falling back to `{Binding}`.

## Special API
- `AppCapture.GetForCurrentView()` may throw at runtime — wrap in try/catch; the static
  `AppCapture.SetAllowedAsync(bool)` still works.

## Dev-agent struggles (each cost ~1 build round-trip)
1. Screen-capture protection: guessed an AppWindow property, then had to switch to the
   `SetWindowDisplayAffinity` P/Invoke. Preventable by a dedicated `screen-capture`
   pattern + inventory route.
2. `x:Bind` DataTemplate over a project-local type failed markup compile; switched to
   `{Binding}`. Preventable by extending the existing x:Bind section.
