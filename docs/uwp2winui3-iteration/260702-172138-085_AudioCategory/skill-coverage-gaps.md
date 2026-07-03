# Skill coverage gaps — AudioCategory (WILL change skill)

## 1. SystemMediaTransportControls.GetForCurrentView() missing from the GetForCurrentView() table
- **Evidence:** UWP `SystemMediaTransportControls.GetForCurrentView()` → migrated
  `mediaPlayer.SystemMediaTransportControls`. `unsupported-api-inventory.json` routes
  `GetForCurrentView()` hits to anchor `getforcurrentview`, whose table (`MIGRATION-PATTERNS.md`
  lines 243-249) lists 5 patterns but omits SMTC.
- **Covered at:** `## GetForCurrentView() Replacements` (line 239) — general principle is prominent,
  but the SMTC-specific row is absent.
- **Why missed:** under-emphasized (missing table row).
- **Improvement:** add one row →
  `SystemMediaTransportControls.GetForCurrentView()` → `mediaPlayer.SystemMediaTransportControls`.
- **Generalizes:** every media app wiring the system transport controls hits this.
