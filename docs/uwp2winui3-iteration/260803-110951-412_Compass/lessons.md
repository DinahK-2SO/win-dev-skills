# Lessons — Compass (score 83)

## Root cause of the one partial
- **Calibration bar never shows.** `CalibrationBar` is a `UserControl` created with `new CalibrationBar()` and never added to the visual tree. Its inner `<Popup>` has no `XamlRoot`, so `CalibrationPopup.IsOpen = true` is a **silent no-op** in WinUI 3 (UWP auto-attached popups to the CoreWindow; WinUI 3 does not). Build is clean, app launches, control looks dead.

## Special API
- **Popup** needs `XamlRoot` set before `IsOpen = true` when it isn't already in the live visual tree — the same requirement as `ContentDialog`.

## Tooling gap
- `Validate-UwpMigration.ps1` had no check for this silent dead-control pattern (it already has an analogous one for background-task `Register()`).

## Preventable by
- Doc: add a Popup+XamlRoot subsection under Dialogs in MIGRATION-PATTERNS.md.
- Tool: validator WARN when `Popup.IsOpen = true` appears with no `XamlRoot` assignment.
