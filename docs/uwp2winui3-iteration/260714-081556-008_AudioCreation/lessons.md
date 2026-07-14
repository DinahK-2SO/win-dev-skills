# Lessons — AudioCreation (UWP → WinUI 3)

Migration **scored 100/100** (6/6 features PASS, parity gate PASS). No parity/visual
defects. All improvement signal comes from **dev-agent build friction** in the log.

## What worked
- `Initialize-UwpMigration.ps1` bootstrap (copy, namespace rewrite, TODO seed) — clean.
- `Get-MigrationPattern.ps1` anchors for **pickers** and **threading** — correct patterns,
  applied to all 7 pickers + both dispatcher sites with no error.
- `Validate-UwpMigration.ps1` — correctly gated "done" and drove the smoke launch.

## Errors encountered (all recoverable)
- **CS0227 unsafe** — AudioGraph frame-buffer code uses `unsafe`; scaffold csproj lacked
  `<AllowUnsafeBlocks>`. First build FAILED. Fixed by adding the flag. *Documented
  reactively in MIGRATION-PATTERNS.md; not auto-handled by the bootstrap.*
- **CS0103 Colors** — unqualified `Colors` lost its `using` after the rewrite. Mapping
  table already covers `Windows.UI.Colors → Microsoft.UI.Colors`. Slip.
- **Validate FAIL: Status=copied** — agent hadn't flipped MIGRATION-MAPPING statuses;
  SKILL.md documents this clearly. Slip.
- **Validate WARN: MIGRATION-DEFERRED.md** — Initialize seeds `| (none) | — |`, but the
  validator looks for the literal text "No items deferred". **Script self-inconsistency**
  → spurious WARN on every zero-deferral migration.

## Special APIs
- **AudioGraph frame access** (IMemoryBufferByteAccess / byte* / FrameInputNode / custom
  IBasicAudioEffect) → requires `unsafe` → csproj must set `<AllowUnsafeBlocks>`.
- **File pickers** → `InitializeWithWindow` (skill covered it; applied cleanly).

## Highest-leverage, generalizable fixes
1. Initialize should seed the DEFERRED file with the validator's expected
   "No items deferred." sentinel (kills a spurious WARN on most migrations).
2. Initialize should auto-enable `<AllowUnsafeBlocks>` when copied source uses `unsafe`
   (prevents a CS0227 build round-trip on audio/image/camera-buffer samples).
