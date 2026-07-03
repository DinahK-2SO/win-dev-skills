# Skill defects — BackgroundTask (run19)

## 1. Manifest `windows.backgroundTasks` Extension not handled (→ 0x80080204)
- **Problem:** Migrated package fails registration `0x80080204`; app never launches; score 0.
- **Evidence:** `migration-score.json` launch failure at manifest line 37; generated
  `Package.appxmanifest` lines 49–61 keep two UWP `windows.backgroundTasks` Extensions.
- **Skill state:** **absent.** `Background Tasks` pattern only covers the code API
  (`IBackgroundTask` → `BackgroundTaskBuilder`); the `Manifest migration checklist` never
  mentions the extension; `Validate-UwpMigration.ps1` 5b has no check for it; the smoke
  launch downgrades a registration failure to WARN.
- **Fix:** (Tier 1) static manifest check that FAILs on a leftover `windows.backgroundTasks`
  Extension; (Tier 3) prose in the Background Tasks section + a Manifest checklist item to
  remove/rework it.
- **Generalizes:** The in-manifest background-task pattern is standard UWP; every such app
  migrated to WinUI 3 desktop fails registration the same way.
