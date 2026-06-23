# Skill defects — ActivitySensor (WILL change skill)

## 1. UWP build artifacts copied into the project → CS0579 build failure
- **Evidence:** turn 37 `Tasks\obj\...\.NETCore,Version=v5.0.AssemblyAttributes.cs: error
  CS0579 Duplicate 'TargetFrameworkAttribute'`; turns 38-43 spent removing artifacts.
- **Skill state:** *wrong* — `Initialize-UwpMigration.ps1` step-1 copy recurses every
  `.cs` with no artifact exclusion; the `bin/obj` exclusion only applies later to the
  namespace-rewrite pass.
- **Root cause:** previously-built UWP source carries `obj/`/`bin/` generated sources and
  `Properties/AssemblyInfo.cs`; SDK-style csproj auto-globs `**/*.cs` and compiles them.
- **Fix:** exclude artifact dirs + `*AssemblyInfo.cs` at the copy step.
- **Generalizes:** virtually every UWP source has been built once and has
  `Properties/AssemblyInfo.cs` → recurs across scenarios.
