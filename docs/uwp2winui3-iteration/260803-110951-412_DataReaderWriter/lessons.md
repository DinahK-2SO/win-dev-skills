# Lessons — DataReaderWriter (index 0)

Outcome: **score 100 / 2 of 2 features pass / builds + runs**. Clean migration; the two
`DataReader`/`DataWriter` scenarios ported without API adaptation.

## What worked
- **Initialize-UwpMigration.ps1** — bootstrapped copy + namespace rewrite + seeded
  MIGRATION-MAPPING.md; agent went straight to editing.
- **Validate-UwpMigration.ps1** — one-shot residue grep + rebuild + WUI-analyzer +
  smoke-launch caught the unfinished `Status=copied` rows before "done".

## Friction / errors
1. **Validator [FAIL] on 4 rows still `Status=copied`** (log 2079-2090). Root cause: agent
   batched all `copied→done` flips to the end and forgot. Skill *already* says flip
   as-you-go (SKILL.md 86/90/167) and the validator caught it → **dev-agent-slip**.
2. **Persistent [WARN]: "MIGRATION-DEFERRED.md exists with content but mapping has no
   defer rows"** (log 2084 & 2115, survived final PASS). Root cause: **producer/consumer
   mismatch inside the skill** — `Initialize-UwpMigration.ps1` seeds DEFERRED.md with a
   placeholder table row `| (none) | — |`, but `Validate-UwpMigration.ps1` (line 266)
   only silences the warning when the file contains the literal `No items deferred`.
   → fires on **every** no-defer migration (the common case). **skill-defect**.

## Special APIs
- `DataReader`/`DataWriter`, `StorageFile.GetFileFromApplicationUriAsync`,
  `OpenSequentialReadAsync`, `ReadBytes()` all work as-is on WinUI 3 desktop — no
  adaptation needed.
