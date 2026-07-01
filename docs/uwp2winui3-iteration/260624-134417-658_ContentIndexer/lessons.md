# Lessons — ContentIndexer (run96)

**Outcome:** Score 100/100 (7/7 pass). Build succeeded first try (BUILD_EXIT=0, 24→48
warnings, all nullable, 0 WUI analyzer warnings). Clean, near-frictionless migration.

## What worked
- **Initialize-UwpMigration.ps1** — copied 14 files, mass-rewrote namespaces, seeded
  MIGRATION-MAPPING.md + TODO markers. Agent went straight to triage.
- **Validate-UwpMigration.ps1** — caught the one process gap (rows still `copied`), ran a
  clean build + smoke launch, drove the app to PASS.
- **ContentIndexer platform APIs** — `Windows.Storage.Search.ContentIndexer` preserved
  unchanged; works in WinUI 3 desktop.

## Errors encountered
- **Validate FAIL: "14 row(s) still Status=copied"** — agent hadn't flipped
  MIGRATION-MAPPING.md `copied`→`done`. Fixed with a bulk replace, re-ran → PASS. (This is
  the intended gate behaviour, not a skill bug.)

## Dev-agent struggle (high-value)
- After the validator already PASSed, a spurious **`[WARN] MIGRATION-DEFERRED.md exists
  with content but mapping has no defer rows — check consistency`** made the agent stop and
  inspect the file (turns 35-36) before concluding it was a harmless placeholder.
  - **Root cause:** `Initialize-UwpMigration.ps1` seeds the empty-deferred file with
    `| (none) | — |` (line 480), but `Validate-UwpMigration.ps1` only treats the file as
    clean when it matches the literal `No items deferred` (line 267). The two sentinels
    disagree, so **every zero-defer migration WARNs**.
  - **Preventable by:** aligning the two scripts on the empty-deferred sentinel.

## Environment (out of scope for the migration skill)
- Scoring session couldn't raster the WinUI window or drive the UWP CoreWindow; score
  relied on UIA trees + manual actuation. Not a migration defect.
