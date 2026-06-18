# Lessons — BasicInput (iteration 2)

## Tools Helpful

- **Initialize-UwpMigration.ps1** — Bootstrap ran cleanly, created MIGRATION-MAPPING.md with 7 rows, injected inline TODOs.
- **Validate-UwpMigration.ps1** — All checks PASS; caught WARN for MIGRATION-DEFERRED.md consistency and environment smoke launch.
- **Get-MigrationPattern.ps1** — Used for anchored pattern lookups to resolve TODOs.

## Failed APIs

- **Windows.UI.Colors (inline fully-qualified)** — Bootstrap rewrites `using` statements but not inline references like `Windows.UI.Colors.RoyalBlue`. Agent had to batch-replace across multiple files.
- **PointerPoint.PointerDevice** — Removed in WinUI 3; `PointerDeviceType` is now directly on `PointerPoint`. Not documented in MIGRATION-PATTERNS.md.

## Errors Encountered

| Error | Root Cause | Fix |
|-------|-----------|-----|
| CS0234: 'Colors' not in 'Windows.UI' | Inline fully-qualified references survive bootstrap rewrite | Batch replace `Windows.UI.Colors` → `Microsoft.UI.Colors` |
| CS1061: 'PointerPoint' has no 'PointerDevice' | WinUI 3 API change not in skill | Changed `.PointerDevice.PointerDeviceType` → `.PointerDeviceType` |

## Dev-Agent Struggles

1. **Build failure cycle (lines 992–1115)** — First build failed with ~30 CS0234 + 2 CS1061 errors. Agent diagnosed and fixed both in one cycle (2 failed builds → 1 successful). **Preventable by**: (a) bootstrap rewriting inline fully-qualified references, (b) adding PointerPoint API change to MIGRATION-PATTERNS.md.

## Environment Issues

- Smoke launch WARN — environment/deploy issue, not code defect. Correctly classified as non-fatal.
