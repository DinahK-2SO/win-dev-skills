# Skill-defects — BackgroundTransfer

## 1. CS0579 duplicate assembly-attribute errors from copied `AssemblyInfo.cs` (absent in skill)
- **Evidence:** session-log line 6850-6884 — build failed with 6× CS0579; offending file
  `Tasks\Properties\AssemblyInfo.cs` (log lines 6977-7007).
- **Skill search:** grepped `AssemblyInfo`, `GenerateAssemblyInfo`, `CS0579`,
  `Duplicate.*attribute` → **zero hits** anywhere in the skill.
- **Root cause:** `Initialize-UwpMigration.ps1` copies all `*.cs` verbatim, including legacy
  `Properties\AssemblyInfo.cs`. SDK-style projects auto-generate the same assembly attributes
  (`GenerateAssemblyInfo` default = true) → duplicate-attribute collision.
- **Fix (Tier 1 + Tier 3):** skip `AssemblyInfo.cs` at copy time in the bootstrap script
  (mirrors the bin/obj skip that prevents CS0101); plus a CS0579 build-error entry in
  MIGRATION-PATTERNS.md as a backstop.
- **Generalizes:** every UWP project / sub-project ships a `Properties\AssemblyInfo.cs`;
  SDK-style WinUI 3 projects always auto-generate those attributes → this CS0579 recurs.
