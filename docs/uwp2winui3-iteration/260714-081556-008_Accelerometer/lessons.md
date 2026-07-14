# Lessons — Accelerometer (iteration 1)

**Outcome:** score 100, builds ✅, runs ✅, parity 6/6 (100% structural coverage, 0 behavioral regressions).

The migration itself was clean. Two *generalizable* frictions surfaced in the build log,
neither of which lowered the score but both of which recur across the whole sample corpus.

## Errors encountered
- **CS8618 ×4 on `SampleConfiguration.cs`** — the shared `Scenario { public string Title; public Type ClassType; }`
  DTO was migrated as-is into a `<Nullable>enable</Nullable>` project, so its non-nullable
  auto-properties tripped CS8618. Fixed in turn 33 by adding field initializers
  (`= string.Empty;`, `= typeof(object);`). This `Scenario` class ships in **87** samples'
  SampleConfiguration.cs → the same warning will appear on every one.

## Dev-agent struggles
1. **Nullable DTO warnings** (turns 32-34): one extra build/fix/rebuild cycle to hit the
   skill's "0 warnings" bar. Skill only documents the nullable pattern for `App.MainWindow`,
   not for plain migrate-as-is data classes. *Preventable by* a one-line pattern note.
2. **Spurious DEFERRED.md WARN** (turn 36): `Validate-UwpMigration.ps1` warned even though
   the migration had zero deferrals. Root cause is a sentinel mismatch between two skill
   scripts — `Initialize-UwpMigration.ps1` seeds `| (none) | — |`, but Validate's PASS
   branch keys on the literal string `No items deferred`. *Preventable by* aligning the
   scaffold to emit that exact sentinel.

## Tools
- **Helpful:** `Initialize-UwpMigration.ps1` (mapping + TODO anchors), `Validate-UwpMigration.ps1`
  (one-shot residue/mapping/build/smoke gate), anchor-based `Get-MigrationPattern.ps1`.
- **Problematic:** the Initialize↔Validate DEFERRED.md contract disagreement (see above).

## Hardware note
No accelerometer on the machine → Enable/Disable dead in **both** apps; not a regression.
