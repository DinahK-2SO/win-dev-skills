# Lessons — Package (iteration 1)

**Outcome:** score 100, builds ✓, runs ✓, all 3 features PASS. Very clean migration.

## Helpful tools
- **Initialize-UwpMigration.ps1** — scaffolded the project, seeded MIGRATION-MAPPING.md (8 rows) and MIGRATION-DEFERRED.md, drove a first-try clean build (Turn 30, "Build succeeded in 18.5s").
- **Validate-UwpMigration.ps1** — caught the one real omission (rows left `Status=copied`) and confirmed PASS + smoke launch after the fix.

## Problematic / limited tooling (the one real, general finding)
- **Validate-UwpMigration.ps1 false WARN.** On a fully-correct migration that defers nothing, it prints
  `[WARN] MIGRATION-DEFERRED.md exists with content but mapping has no defer rows — check consistency`.
  Root cause: the validator's "no defer rows" PASS path only recognizes the literal phrase `No items deferred`,
  but `Initialize-UwpMigration.ps1` seeds a `| (none) | — |` placeholder row instead. The PASS branch is dead;
  the WARN fires on every scenario with zero deferrals (the common case). Seen at Turns 31 and 33.

## Errors encountered
- **[FAIL] 8 rows still `Status=copied`** (Turn 31) → agent had migrated files but not flipped Status. Fixed by
  bulk edit copied→done (Turn 32); re-run PASS (Turn 33).

## Dev-agent struggles
- The extra validate cycle mixed a *real* [FAIL] with a *false* [WARN]. The false WARN can send an agent hunting a
  non-existent consistency problem. Preventable by fixing the validator's no-defer branch.

## Environment (not a skill issue)
- UWP golden was dark theme, WinUI render was light. The UWP source set no `RequestedTheme`, so this is a
  capture-environment default, cosmetic, and correctly out of scope for a skill change.
