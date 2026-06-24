# Lessons — ApplicationResources (iteration 1)

## Outcome
- Build: OK (0 errors, 182 CA1416 warnings). Launch: OK. UIA tree: complete (53 elements, non-zero bounds, isOffscreen=false). Compare-Parity structural: 100/100 (4/4 controls).
- **Score: 0 (fail=1).** Single dominant defect: the migrated window **renders visually blank** — only the Win32 caption buttons paint; the client area is solid white. Verified by two capture methods (winapp screenshot 11KB solid ×2, PrintWindow PW_RENDERFULLCONTENT 5.7KB blank) while the same tooling captured the UWP golden's full content (145KB).

## Root cause (high-value)
The `dotnet new winui` scaffold injects into `MainWindow.xaml`:
```xml
<Window.SystemBackdrop><MicaBackdrop /></Window.SystemBackdrop>
```
The agent kept it. A window with a **SystemBackdrop composites its XAML content through DWM**, so `PrintWindow`/BitBlt capture of the top-level HWND returns only the (transparent) backdrop layer — recorded as a blank/solid frame — not the XAML content. The UWP source rendered on an **opaque** background and used **no** acrylic/mica (verified: 0 `AcrylicBrush`/`SystemBackdrop` hits under `.uwp-source`). So the backdrop is a pure scaffold artifact that both (a) diverges from the UWP appearance and (b) makes the content non-capturable.

This is the classic **"compiles + launches + UIA present + renders nothing"** failure that structural coverage misses.

## Tooling notes
- `Validate-UwpMigration.ps1` Section 7 (runtime smoke launch) only verifies process-alive, so a blank-but-alive window passes. It needs a static guard for blank-render-prone scaffold defaults.

## Preventable by
- Skill rule: delete the scaffold `<Window.SystemBackdrop>` and set an explicit opaque `Background` unless the UWP used acrylic/mica.
- Validator WARN when a window XAML keeps a `SystemBackdrop`/`MicaBackdrop` and the `.uwp-source` shows no acrylic/mica usage.
