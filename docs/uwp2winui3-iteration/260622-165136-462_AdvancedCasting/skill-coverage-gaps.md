# Skill coverage gaps — AdvancedCasting (WILL change skill)

## 1. Validator's manifest PASS doesn't mean launch-ready
- **Problem:** `Validate-UwpMigration.ps1` 5b PASSes on TargetDeviceFamily/rescap/
  runFullTrust only, so a manifest with an unsupported `<Extensions>` entry still gets
  `[PASS]` and the agent stops.
- **Covered at:** `Validate-UwpMigration.ps1` lines 331-371; `MIGRATION-PATTERNS.md`
  manifest checklist (458-490).
- **Why missed:** under-emphasized — the existing manifest gate doesn't look at
  `<Extensions>`.
- **Improvement:** broaden the existing 5b check + checklist to also reject UWP-only
  extension categories so the existing PASS signal is trustworthy.
- **Generalizes:** makes the last-gate PASS meaningful for every migration.
