# Skill defects — DataReaderWriter (index 0)

## 1. DEFERRED.md zero-defer sentinel mismatch (Initialize vs Validate)
- **Problem:** spurious `[WARN] MIGRATION-DEFERRED.md exists with content but mapping has
  no defer rows` on every no-defer migration.
- **Evidence:** session-log lines 2084 & 2115 (WARN survives final PASS); seeded
  DEFERRED.md holds `| (none) | — |`.
- **State:** wrong. `Initialize-UwpMigration.ps1` seeds `| (none) | — |`;
  `Validate-UwpMigration.ps1` line 266 only silences the warning on the literal
  `No items deferred`.
- **Fix:** in the initializer's `deferredKeys.Count -eq 0` branch, write the sentinel
  `No items deferred.` instead of the placeholder table row.
- **Generalizes:** most sample migrations defer zero files → this WARN fires on nearly
  every clean run and undermines validator trust.
