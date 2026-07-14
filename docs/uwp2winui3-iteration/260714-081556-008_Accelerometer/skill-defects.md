# Skill defects — Accelerometer (WILL change skill)

## 1. DEFERRED.md zero-defer sentinel mismatch between Initialize and Validate
- **Problem:** clean zero-deferral migration is flagged `[WARN] MIGRATION-DEFERRED.md exists
  with content but mapping has no defer rows`.
- **Evidence:** session-log.txt:3609; trial `MIGRATION-DEFERRED.md` has `| (none) | — |`
  and never the string `No items deferred`.
- **State:** wrong (two scripts disagree).
  - `Initialize-UwpMigration.ps1:439-441` seeds `| (none) | — |`.
  - `Validate-UwpMigration.ps1:266` PASSes only if the file matches `No items deferred`.
- **Fix:** make Initialize seed the exact sentinel `No items deferred.` in the zero-defer case.
- **Generalizes:** zero-deferral is the common happy path for simple API/sensor samples, so
  this false WARN fires on nearly every scenario.
