# Skill defects (WILL change skill) — ActivitySensor

## 1. CS0579 duplicate-attribute from stale nested UWP `obj`/`bin` artifacts
- **Evidence:** `session-log.txt` — two failed builds (4 then 6 errors); paths `Tasks\obj\x64\Release\.NETCore,Version=v5.0.AssemblyAttributes.cs` and `obj\...\ActivitySensor.AssemblyInfo.cs`.
- **Skill search:** no hits for CS0579 / AssemblyInfo / DefaultItemExcludes / obj-exclusion in SKILL.md or MIGRATION-PATTERNS.md; `Initialize-UwpMigration.ps1` copy step had no obj/bin guard.
- **State:** absent.
- **Root cause:** `Initialize-UwpMigration.ps1` step 1 copies all `*.cs` recursively with no bin/obj exclusion (the exclusion lived only in the namespace-rewrite step). Stale UWP artifacts under a nested background-task subfolder were copied + globbed; the SDK only auto-excludes the project's *own* root obj/bin.
- **Fix:** add bin/obj/.vs/.uwp-source/.git exclusion to the copy loop (Tier-1); document CS0579 in MIGRATION-PATTERNS.md (delete stray obj/bin, `DefaultItemExcludes=**/obj/**;**/bin/**`, drop carried-over `Properties\AssemblyInfo.cs`).
- **Generalizes:** UWP apps frequently carry obj/bin, and background-task / component subprojects live in nested subfolders not covered by the SDK's root-only exclusion. Any copy-based migration of such an app hits CS0579 → structural, scenario-independent.
