# Skill defects (WILL change skill) — Geolocation

## 1. Copied `windows.backgroundTasks` manifest extension blocks AppX registration (0x80080204)

- **Problem:** Packaged WinUI 3 app builds clean but fails to launch — AppX registration
  rejects the manifest with `0x80080204` because it still carries UWP
  `<Extension Category="windows.backgroundTasks" EntryPoint="...">` blocks with no
  matching `windows.activatableClass.inProcessServer` registration. All 8 scenarios
  unreachable → 0/100.
- **Evidence:** `migration-score.json` `winui_launch_error` (0x80080204, line 31);
  `discrepancies.md` "Blocking defect"; manifest has 3 background-task extensions.
- **Skill search:** grep for `backgroundTask|activatableClass|inProcessServer|
  ActivatableClassId` in the migration skill → **no matches**. Manifest checklist covers
  only TargetDeviceFamily/rescap/runFullTrust; `Validate-UwpMigration.ps1` Section 5b
  likewise.
- **Skill state:** **absent**.
- **Root cause:** Skill has no awareness that UWP background-task manifest extensions are
  invalid in a packaged WinUI 3 manifest without an in-process activatable-class entry.
- **Proposed fix:** Tier 1 — add a `Validate-UwpMigration.ps1` static check that FAILs on
  `windows.backgroundTasks` EntryPoint extensions. Tier 3 — add a checklist item to
  MIGRATION-PATTERNS.md (remove by default, or register the inProcessServer class).
- **Generalizes:** UWP samples commonly ship background tasks; copying the manifest as-is
  deterministically zeroes the launch on any of them.
