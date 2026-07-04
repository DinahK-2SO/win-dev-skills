# Skill defects — Geotag (WILL change skill)

## 1. Blank window from the scaffold's system backdrop (content present, whole window unpainted)
- **Problem:** Migrated app renders fully blank white; visual/UIA tree populated, "Choose
  file" responds. Requirement FAIL (0/1).
- **Evidence:** `notes/winui-live-recheck.png`; score `discrepancies.json` id
  `blank-render` (critical, rendering). `MainWindow.xaml` has
  `<Window.SystemBackdrop><MicaBackdrop/></Window.SystemBackdrop>` (session-log 1120-1122).
- **Skill state:** **absent.** Grepped SKILL.md + MIGRATION-PATTERNS.md for
  Mica/Backdrop/SystemBackdrop/blank/render — the only "blank" coverage is about content
  *missing* from the tree (nav/init throws, deferred hero controls). The "content present,
  window unpainted" mechanism is not covered.
- **Root cause:** `dotnet new winui` scaffolds a system backdrop; backdrops need DWM
  composition, unavailable in headless/VM/RDP capture → whole window paints blank. An
  opaque page background does not rescue it (one was already set).
- **Proposed fix:** MIGRATION-PATTERNS anchor `#system-backdrop-blank` + SKILL.md pointer +
  a `Validate-UwpMigration.ps1` WARN that flags any `.xaml` with `Window.SystemBackdrop` /
  `MicaBackdrop` / `DesktopAcrylicBackdrop`; fix = remove the backdrop / ship an opaque
  surface matching the UWP original.
- **Generalizes:** every scaffolded migration inherits the backdrop; every capture is
  headless/VM; UWP originals were opaque → recurs across all scenarios.
