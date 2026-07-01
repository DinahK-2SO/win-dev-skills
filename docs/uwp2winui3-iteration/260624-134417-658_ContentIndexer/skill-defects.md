# Skill Defects — ContentIndexer (run96)  → WILL change skill

## 1. Empty MIGRATION-DEFERRED.md triggers a spurious validator WARN (sentinel mismatch)
- **Evidence:** `session-log.txt` lines 3364 & 3418 print
  `[WARN] MIGRATION-DEFERRED.md exists with content but mapping has no defer rows — check
  consistency`; turns 35-36 the dev-agent opens the file to investigate, on a 100/100 app.
- **Skill state:** wrong (two scripts disagree).
  - `Initialize-UwpMigration.ps1:480` seeds the empty file with `| (none) | — |`.
  - `Validate-UwpMigration.ps1:267` only treats it as clean if it matches `No items deferred`.
- **Root cause:** inconsistent empty-deferred sentinel between the seeder and the validator.
- **Fix:** align the sentinel — Initialize writes an explicit `No items deferred.` note in
  the zero-defer branch, and Validate also accepts the `| (none) |` placeholder as clean.
- **Generalizes:** zero-defer is the common case (this sample deferred nothing). Every such
  migration currently trips the same false WARN and burns dev-agent turns at the finish.
