# Lessons — Personalization (UWP→WinUI 3), score 100/100

The migration succeeded fully (1/1 feature pass, builds + runs). Evidence is drawn from
the dev-agent's build log, since parity was clean.

## Tools that worked
- **Initialize-UwpMigration.ps1** — copied source, preserved UWP .csproj at `.uwp-source/`,
  seeded mapping + triage. Self-check `Test-Path MIGRATION-MAPPING.md` = True.
- **Get-MigrationPattern.ps1 -Anchor pickers** — fetched a single pattern instead of the whole file.
- **Validate-UwpMigration.ps1** — confirmed clean build (0 WUI analyzer warnings).

## Errors encountered
1. **CS0102/CS0111 duplicate `App` members** — a botched in-place edit doubled the entire
   `App` class body in `App.xaml.cs`. Fixed by deleting the duplicate block.
2. **WMC0909 "Cannot resolve DataType local:Scenario" + WMC1509** — a *cascade* from error 1.
   With the C# broken, `MarkupCompilePass2` had no local assembly, so it flagged every
   project-local type as unresolvable. Fixing the C# made the WMC errors vanish with no XAML edit.

## Dev-agent struggles (high-value)
- Wasted signal from the WMC XAML errors that were actually secondary to a C# compile failure
  → **preventable by** a "fix CSxxxx errors first" diagnostic note.
- Manual `SDKTemplate` → `Personalization` namespace rewrites across `.cs`, `x:Class`, and
  `xmlns:local` → **preventable by** the bootstrap auto-reconciling the root namespace.

## Env
- Blank WinUI screenshot in the scoring session is an eval-side DirectComposition capture
  artifact, not a migration defect (UIA tree + live picker confirm rendering).
