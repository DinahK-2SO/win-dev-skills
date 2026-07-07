# Skill defects — LanguageFont (WILL change skill)

## 1. Bootstrap/validator disagree on the empty-deferral sentinel → spurious WARN
- **Problem:** Zero-deferral migrations always trip
  `[WARN] MIGRATION-DEFERRED.md exists with content but mapping has no defer rows`.
- **Evidence:** session-log TURN 33 & 35 emit the WARN; run is 100/100 with no defer rows.
- **Skill state:** `wrong` (internal contradiction between two migration-skill scripts).
  - `Validate-UwpMigration.ps1:268` PASSes only if the file matches `No items deferred`.
  - `Initialize-UwpMigration.ps1:479-481` writes `| (none) | — |` and never that string.
- **Fix:** Bootstrap also emits `_No items deferred._` in the empty branch.
- **Generalizes:** Many UWP samples defer nothing, so this false WARN recurs broadly and
  misleads at the final validation gate.
