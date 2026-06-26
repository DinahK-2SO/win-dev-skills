# Skill defects — AudioCreation (WILL change skill)

## 1. Legacy `AssemblyInfo.cs` → CS0579 duplicate assembly attributes (ABSENT)
- **Evidence:** session-log ~6093 (12× CS0579); fix at ~6185 (`GenerateAssemblyInfo=false`);
  agent note: "CustomEffect\\Properties\\AssemblyInfo.cs conflicts with the SDK-generated one."
- **Skill state:** absent — no mention of `AssemblyInfo`, `GenerateAssemblyInfo`, or CS0579.
- **Root cause:** UWP `Properties\AssemblyInfo.cs` carries assembly attributes the SDK-style
  WinUI csproj auto-generates → duplicate-attribute errors.
- **Fix:** Tier 1 — drop `AssemblyInfo.cs` in `Initialize-UwpMigration.ps1`'s copy filter;
  Tier 3 — document CS0579 in the build-errors section.
- **Generalizes:** every classic UWP project ships `Properties\AssemblyInfo.cs`.
