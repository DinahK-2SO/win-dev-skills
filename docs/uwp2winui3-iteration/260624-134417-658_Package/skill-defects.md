# Skill defects — Package (WILL change skill)

## 1. Validator false WARN when nothing is deferred (Tier-1 tooling contradiction)
- **Problem:** `Validate-UwpMigration.ps1` prints `[WARN] MIGRATION-DEFERRED.md exists with content but mapping has no defer rows — check consistency` on correct, defer-nothing migrations.
- **Evidence:** session-log.txt Turn 31 (line 2245) and Turn 33 (line 2277) — WARN present in both runs; DEFERRED file holds only the seeded `| (none) | — |` row.
- **Skill state:** wrong / internally inconsistent.
- **Wrong text:** validator (~line 268) tests `if ($deferText -notmatch 'No items deferred')`, but `Initialize-UwpMigration.ps1` (~line 480) seeds `| (none) | — |` and never writes "No items deferred". The PASS branch is dead; the WARN always fires.
- **Root cause:** seed template and validator sentinel are out of sync.
- **Fix:** in the no-defer branch, count real DEFERRED data rows (ignore header/separator and the `| (none) |` placeholder); PASS when zero, WARN only when real files are listed with no matching defer rows.
- **Generalizes:** any scenario that defers nothing (the common case) hits this false WARN. A structural check fixes all of them.
