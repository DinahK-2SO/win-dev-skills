# CameraProfile — Lessons

Outcome: **100/100**, builds + runs, 0 functional discrepancies. All struggles were
process friction, not correctness failures.

## Helpful tools
- `Initialize-UwpMigration.ps1` — clean bootstrap (scaffold, TODO anchors, mapping/deferred seed).
- `Get-MigrationPattern.ps1 -Anchor threading` — resolved the `Dispatcher.RunAsync` TODOs.
- `Validate-UwpMigration.ps1` — gated the handoff (PASS).

## Problematic / limitation
- **`Validate-UwpMigration.ps1` spurious DEFERRED WARN.** On a zero-deferral migration the
  validator prints `[WARN] MIGRATION-DEFERRED.md exists with content but mapping has no defer
  rows` because it only accepts the literal phrase `No items deferred`, while the bootstrap
  seeds a `| (none) | — |` placeholder row. The two never agree on the empty case. Cost the
  dev agent 2 turns (R15-R16) to confirm the WARN was benign.

## Errors encountered
- Duplicate class/namespace after a partial whole-file `edit` (R12-R14) — old_str matched only
  the header, leaving the old body appended. Fixed by removing the duplicated tail.

## Dev-agent struggles (high value)
1. **DEFERRED WARN** (R15-R16) — producer/validator sentinel mismatch. *Preventable by aligning
   the two scripts on the empty-deferred marker.*
2. **SDK-sample shell reconstruction** (R9-R11) — SKILL.md names the `MainPage + ListView +
   Frame (SDK-sample idiom)` row but not the SDKTemplate helpers (`MainPage.Current`,
   `NotifyUser`/`NotifyType`, `SampleConfiguration` partial `MainPage`, App.xaml sample styles)
   nor the `SDKTemplate` -> app namespace consolidation. *Preventable by a short note under the
   existing shell row.*
3. **Whole-file rewrite duplicate** (R12-R14) — general editing slip, not migration-specific.
