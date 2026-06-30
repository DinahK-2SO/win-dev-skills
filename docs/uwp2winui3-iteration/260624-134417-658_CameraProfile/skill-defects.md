# CameraProfile — Skill Defects (WILL change skill)

## 1. Spurious MIGRATION-DEFERRED.md WARN on zero-deferral migrations  *(Tier 1, script bug)*
- **Problem:** Validator prints `[WARN] MIGRATION-DEFERRED.md exists with content but mapping
  has no defer rows` even when nothing was deferred.
- **Evidence:** build-events.jsonl R15-R16 (2 turns confirming the WARN was benign);
  `Validate-UwpMigration.ps1:267-268`; `Initialize-UwpMigration.ps1:479-481`.
- **Root cause:** Producer/validator sentinel mismatch — bootstrap seeds `| (none) | — |`,
  validator only accepts the literal phrase `No items deferred`.
- **Fix:** Make the validator accept the `(none)` placeholder as the clean empty state, and
  have the bootstrap also emit `No items deferred.`.
- **Generalizes:** Zero deferrals is the common case; this WARN fires on nearly every
  migration regardless of app.
