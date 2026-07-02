# Skill Defects — AdvancedCasting (index 1)

## 1. Entry-point build crash (CS5001 + WMC1509 + WMC9999) is undocumented and undiagnosed → **change skill**

- **Problem:** migrated `.csproj` defined `DISABLE_XAML_GENERATED_MAIN` with no `Program.cs`/`Main`; XAML markup compiler crashed (`WMC9999`), no entry point emitted (`CS5001`). Score 0.
- **Evidence:** score-notes `winui-build.log` L181-183; the csproj `<DefineConstants>` line. Reproduced deterministically on a clean `dotnet new winui` scaffold (add constant → identical 3 errors; remove → build succeeds).
- **Skill state:** **absent** — the build-error catalog covers only CS0104 / CS0227 / CS0246; nothing on CS5001 / WMC9999 / the generated `Main`.
- **Fix:** documented signature + root cause + fix in `MIGRATION-PATTERNS.md`; added a targeted validator hint in `Validate-UwpMigration.ps1`.
- **Generalizes:** project-level entry-point config trap; `WMC9999`'s opaque wording misleads any agent toward a non-existent XAML bug. Recurs across scenarios.
