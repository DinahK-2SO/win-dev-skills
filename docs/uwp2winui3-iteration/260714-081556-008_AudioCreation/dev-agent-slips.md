# Dev-Agent Slips — AudioCreation (will NOT change skill)

## 1. CS0103 'Colors' after rewrite
- Covered clearly: MIGRATION-PATTERNS.md mapping table row
  `Windows.UI.Colors → Microsoft.UI.Colors`.
- Slip: read-but-ignored. A re-run consulting the table fixes it. No skill edit.

## 2. Validate FAIL on Status=copied rows
- Covered clearly: SKILL.md Step 3 ("Flip `Status` copied → done as each row is
  finished") and Step 4 diagnostic for `Status = copied` rows.
- Slip: did-not-read. Documented prominently in two places. No skill edit.

## 3. File pickers needing InitializeWithWindow
- Covered clearly: `Get-MigrationPattern.ps1 -Anchor pickers`. Agent applied it to all 7
  pickers successfully — a positive, not a failure. No skill edit.
