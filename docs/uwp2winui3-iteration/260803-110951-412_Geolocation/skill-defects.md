# Skill defects — Geolocation

## CS0579 duplicate assembly attribute from copied `AssemblyInfo.cs` — **absent**
- **Evidence:** 42× `error CS0579`; agent: "This UWP-era AssemblyInfo.cs conflicts with
  auto-generated attributes. I need to delete it."
- **Skill state:** grep for AssemblyInfo / CS0579 / GenerateAssemblyInfo → 0 hits.
- **Root cause:** SDK-style WinUI 3 auto-generates assembly attributes; the copied UWP
  `Properties\AssemblyInfo.cs` re-declares them.
- **Fix:** Tier-1 — `Initialize-UwpMigration.ps1` should not copy assembly-attribute-only
  `AssemblyInfo.cs`. Tier-3 backstop — PATTERNS.md CS0579 entry.
- **Generalizes:** every UWP project has `AssemblyInfo.cs`; every SDK-style WinUI target
  auto-generates the same attributes → guaranteed collision.
