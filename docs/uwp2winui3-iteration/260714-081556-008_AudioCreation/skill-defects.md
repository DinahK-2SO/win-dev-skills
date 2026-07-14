# Skill Defects — AudioCreation (WILL change skill)

## 1. Zero-deferral migrations trip a spurious MIGRATION-DEFERRED.md WARN
- **State:** wrong (two migration-skill scripts disagree on the empty-defer sentinel).
- **Evidence:** validation output ~line 4925 — WARN fired on a clean, zero-defer build.
- **Wrong contract:**
  - `Initialize-UwpMigration.ps1` empty branch writes `| (none) | — |`.
  - `Validate-UwpMigration.ps1` only suppresses the WARN when the file matches the
    literal text `No items deferred`.
- **Fix:** seeder writes the `No items deferred.` sentinel in the empty-defer branch.
- **Generalizes:** most simple samples defer nothing → this WARN fires on nearly every
  clean migration; removing it de-noises the mandatory Validate gate.
