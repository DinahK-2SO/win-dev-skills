# Skill defects — BackgroundSensors (→ WILL change skill)

## 1. Legacy `Properties\AssemblyInfo.cs` copied → CS0579 duplicate-attribute build break
- **Evidence:** session-log turns 39–43 ("Build failed with 6 error(s)"), fixed at turn 40 with
  `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>`. The copied `BackgroundTask\Properties\AssemblyInfo.cs`
  holds `[assembly: AssemblyTitle/Company/Configuration/Product/...]`.
- **Skill search:** grepped for `AssemblyInfo`, `GenerateAssemblyInfo`, `CS0579` — **absent** everywhere.
- **Root cause:** `Initialize-UwpMigration.ps1` copies all `*.cs` including the legacy UWP
  `Properties\AssemblyInfo.cs`; SDK-style WinUI projects auto-generate the same attributes
  (`GenerateAssemblyInfo` default `true`) ⇒ duplicate definitions. Multi-project samples bring one
  per sub-project, multiplying the errors.
- **Fix (applied):** skip copying `Properties\AssemblyInfo.cs` in the script; document the CS0579
  root cause + `GenerateAssemblyInfo=false` fallback in MIGRATION-PATTERNS.md.
- **Generalizes:** every classic UWP project has this file and every SDK-style WinUI target
  auto-generates the attributes — recurs on essentially every migration.
