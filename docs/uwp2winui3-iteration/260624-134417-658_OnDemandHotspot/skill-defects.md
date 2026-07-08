# Skill defects — OnDemandHotspot (WILL change skill)

## 1. Manifest checklist/validator ignore SCCD-gated custom capabilities

- **Problem:** App builds clean but fails package registration
  (`0x80073CF6` / inner `0x80070002` on the `windows.capability` extension) and never
  launches, because `Package.appxmanifest` kept the UWP sample's
  `uap4:CustomCapability Name="Microsoft.onDemandHotspotControl_8wekyb3d8bbwe"`, which
  requires an SCCD absent for a sideloaded package.
- **Evidence:** `migration-score.json.winui_launch_error`; `discrepancies.md` Blocker;
  `results.json` `runs=false`; final manifest `<Capabilities>` still has
  `<uap4:CustomCapability .../>`.
- **Skill search:** grepped `CustomCapability|SCCD|restricted|capability` across
  `SKILL.md`, `MIGRATION-PATTERNS.md`, `scripts/*.ps1`.
- **Skill state:** **absent** (background tasks + runFullTrust covered; custom capabilities not).
- **Wrong text:** item 3 "Keep any UWP `<Capability>` entries you actually use" — no
  carve-out for SCCD-gated capabilities.
- **Proposed fix:** `Validate-UwpMigration.ps1` check 5d + `MIGRATION-PATTERNS.md` checklist
  item 6 + `SKILL.md` item 5 note — all directing removal of `uap4:CustomCapability` /
  SCCD-gated capabilities.
- **Generalizes:** UWP SDK samples commonly declare custom/restricted SCCD-gated
  capabilities; each one breaks sideloaded WinUI 3 registration identically until removed.
