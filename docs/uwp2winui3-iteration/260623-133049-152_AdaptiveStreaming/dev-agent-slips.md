# Dev-agent slips (skill already clear → do NOT change skill)

## 1. CS0103 `CoreDispatcherPriority` left un-migrated in Scenario5
- Covered prominently at `MIGRATION-PATTERNS.md#threading` (dedicated anchor + worked
  example) and named in SKILL.md Step 3. The agent migrated the same pattern correctly in
  most files; Scenario5 was missed before the budget ran out. Incomplete-pass slip —
  `Validate-UwpMigration.ps1` residue grep would have caught it on a complete run.

## 2. CS0165 unassigned local `currentPosition`
- Plain C# definite-assignment mistake, no UWP API involved. Not a migration-skill
  concern.

## 3. WMC9999 XAML internal NRE
- Downstream cascade from the un-compilable code-behind (the CS0103/CS0104 errors). The
  collision-driven WMC9999 that *does* need guidance is already prevented by the bootstrap
  root-namespace guard. Clears once the C# errors are fixed.
