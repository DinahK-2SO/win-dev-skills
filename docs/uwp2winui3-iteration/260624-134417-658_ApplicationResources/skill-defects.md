# Skill Defects — ApplicationResources (iteration 1)

## 1. Blank render from scaffold `MicaBackdrop` (absent guidance) → WILL change skill
- **Problem:** Migrated window paints solid white despite a complete UIA tree + clean build (score 0).
- **Evidence:** `MainWindow.xaml` lines 11-13 keep `<Window.SystemBackdrop><MicaBackdrop/>`; `discrepancies.json` blank-render critical; `migration-score.json` fail.
- **Skill state:** ABSENT. Skill only covers acrylic *API mapping* and a *device-init* blank-window case — nothing on the scaffold's window backdrop or its capture effect.
- **Root cause:** A `SystemBackdrop` composites XAML through DWM; PrintWindow/BitBlt capture returns the transparent backdrop layer (blank/solid), not the content. The UWP used an opaque background and no acrylic/mica.
- **Fix:** SKILL.md fidelity rule to delete the scaffold `<Window.SystemBackdrop>` + set an opaque root Background, plus a `Validate-UwpMigration.ps1` WARN when a window keeps a backdrop the UWP source never used.
- **Generalizes:** Every migration starts from `dotnet new winui` (ships MicaBackdrop); UWP samples almost never used Mica/Acrylic, so the blank-capture risk recurs everywhere. One-line, universally faithful fix.
