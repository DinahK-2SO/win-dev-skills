# Skill Defects — HotspotAuthentication (WILL change skill)

## 1. CS0579 duplicate assembly attributes from copied legacy `AssemblyInfo.cs`
- **Problem:** first build failed with 12× `error CS0579: Duplicate '…Attribute'`
  (AssemblyCompany/Configuration/Title/Version/FileVersion/…).
- **Evidence:** `build-events.jsonl ~L784-806` — dev-agent: *"The build errors are duplicate
  assembly attributes from …\Properties\AssemblyInfo.cs"* → *"Fix by adding
  `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>`"*. Migrated csproj now has that flag;
  the copied `AssemblyInfo.cs` is standard VS boilerplate.
- **Skill search:** grep for `AssemblyInfo` / `GenerateAssemblyInfo` / `CS0579` across the
  whole skill → **0 matches**. State: **absent**.
- **Root cause:** bootstrap copies UWP `Properties\AssemblyInfo.cs` verbatim; SDK-style
  projects default `GenerateAssemblyInfo=true` and emit the same attributes → each declared
  twice.
- **Proposed fix:** *Tier 1* — exclude `AssemblyInfo.cs` from the copied build sources in
  `Initialize-UwpMigration.ps1` (same rationale as the existing ILC `*.g.cs` exclusion).
  *Tier 3 backstop* — document CS0579 + both fixes in MIGRATION-PATTERNS.md "Common build
  errors".
- **Generalizes:** every classic UWP C# project has a VS-generated `AssemblyInfo.cs`; every
  WinUI 3 target is SDK-style with auto-generated assembly info → this recurs across
  essentially all UWP→WinUI 3 migrations.
