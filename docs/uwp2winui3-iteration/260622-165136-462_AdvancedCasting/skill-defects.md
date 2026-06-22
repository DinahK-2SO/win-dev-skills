# Skill defects — AdvancedCasting (WILL change skill)

## 1. UWP-only manifest `<Extensions>` carried over → app can't register/launch
- **Problem:** Build is clean but the packaged WinUI 3 app fails registration with
  `AppxManifest.xml(30,10) 0x80070032 / 0x80073CF6` because the UWP
  `<uap:Extension Category="windows.dialProtocol">` block was merged into
  `Package.appxmanifest` (lines 40-44).
- **Evidence:** score notes `migration-score.json` (`winui_launchable:false`),
  `discrepancies.json` (severity `blocking`); generated manifest.
- **Skill state:** *wrong*. `MIGRATION-PATTERNS.md:440` lists `<uap:Extension>` as
  merge-safe content with **no caveat**; `Validate-UwpMigration.ps1` never inspects
  `<Extensions>` and false-PASSes.
- **Proposed fix:** (Tier 1) add an `<Extensions>` denylist scan to
  `Validate-UwpMigration.ps1`; (Tier 3) add a caveat to the manifest checklist telling
  the agent to drop UWP-only extension categories before the first launch.
- **Generalizes:** UWP apps commonly declare activation-model extensions; carrying them
  verbatim is a recurring build-clean-but-won't-launch failure mode.
