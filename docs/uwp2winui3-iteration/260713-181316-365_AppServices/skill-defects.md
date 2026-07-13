# Skill defects — AppServices (→ WILL change skill)

- **Legacy `Properties\AssemblyInfo.cs` → CS0579 / CS0246.** SDK-style WinUI 3 projects
  auto-generate assembly attributes, so the copied UWP `AssemblyInfo.cs` produces
  duplicate-attribute (`CS0579`) errors, plus `CS0246` unresolved attribute types.
  - Evidence: session-log.txt:3172-3177, :3388-3393; fixed turns 38-41 (2 wasted cycles).
  - Skill state: **absent** (no AssemblyInfo/GenerateAssemblyInfo/CS0579 anywhere).
  - Fix: **Tier 1** — empty copied `AssemblyInfo.cs` in `Initialize-UwpMigration.ps1`;
    **Tier 3** — CS0579 subsection in MIGRATION-PATTERNS.md 'Common build errors'.
  - Generalizes: every UWP/classic project ships `AssemblyInfo.cs`; every scaffold is SDK-style.
