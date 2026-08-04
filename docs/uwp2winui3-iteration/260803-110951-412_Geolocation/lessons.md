# Lessons — Geolocation (UWP → WinUI 3)

Final result: **build SUCCEEDED, score 100/100, 0 parity discrepancies.** All value is
in *how* the build got there — two error floods the dev-agent had to dig out of.

## Errors encountered
- **CS0579 Duplicate assembly attribute (×42).** UWP `Properties\AssemblyInfo.cs` was
  copied into the migrated tree; the SDK-style WinUI 3 project auto-generates the same
  assembly attributes (`GenerateAssemblyInfo` defaults on) → conflict. Fixed by deleting
  the file.
- **CS0111/CS0102/CS0106/CS0101/CS1022/CS8803 duplicate-definition flood (700+).** The
  dev-agent's header-only edits on copied UWP `.cs` files left the original body intact,
  duplicating every type/member across many files. Fixed by overwriting each file whole.

## Dev-agent struggles
1. Duplicate-definition flood across all Scenario*.xaml.cs / SampleConfiguration.cs /
   Tasks\Helpers.cs — self-inflicted by header-only edits; resolved by full-file overwrite.
   *Preventable by:* skill guidance to full-replace copied UWP files and to overwrite
   wholesale when duplicate-definition errors appear.
2. CS0579 from copied `AssemblyInfo.cs`. *Preventable by:* bootstrap not copying it +
   a PATTERNS.md CS0579 entry.

## Tool limitation
- `Initialize-UwpMigration.ps1` copies `AssemblyInfo.cs` verbatim → guaranteed CS0579 in
  every UWP migration. Should be excluded/neutralized at copy time.
