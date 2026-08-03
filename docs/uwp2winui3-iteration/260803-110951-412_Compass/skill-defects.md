# Skill defects — Compass

## 1. Popup opened without XamlRoot = silent no-op (ABSENT)
- **Evidence:** Calibration feature partial; migrated `CalibrationBar.xaml.cs` sets `CalibrationPopup.IsOpen=true` with no `XamlRoot`; banner never shows.
- **Skill state:** absent — skill documents `XamlRoot` for `ContentDialog` only.
- **Fix:** add Popup+XamlRoot subsection to MIGRATION-PATTERNS.md Dialogs; add validator WARN for `Popup.IsOpen=true` without `XamlRoot`.
- **Generalizes:** Popup overlays are common in UWP; WinUI 3 requires XamlRoot on any popup not already in the visual tree. Recurs across scenarios.
