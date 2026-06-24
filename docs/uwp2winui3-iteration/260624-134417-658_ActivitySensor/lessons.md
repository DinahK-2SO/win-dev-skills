# Lessons — ActivitySensor (UWP→WinUI 3)

Score **88** (3 pass / 1 partial / 0 fail). Builds: yes. Runs: yes. Structural parity 100%.

## Helpful tools
- **Initialize-UwpMigration.ps1** — preserved UWP `.csproj` reference + mass namespace rewrite.
- **Validate-UwpMigration.ps1** — clear PASS done-signal (0 warnings, 0 WUI).

## Problematic / limitations
- **Initialize-UwpMigration.ps1 copy step** copies every `*.cs` recursively with **no obj/bin exclusion**. Stale UWP build artifacts (`Tasks\obj\...\.NETCore,Version=v5.0.AssemblyAttributes.cs`, generated `*.AssemblyInfo.cs`) were dragged into the project. The obj/bin exclusion existed only in the later namespace-rewrite step, not in the copy.

## Errors encountered (all one root cause)
- **CS0579 Duplicate `TargetFrameworkAttribute` / `AssemblyCompanyAttribute` / `AssemblyVersionAttribute` …** — two failed build iterations. Root cause: nested stale `obj` `.cs` files compiled by the SDK default glob (the SDK only auto-excludes the project's *own* root obj/bin, not nested component/background-task ones). Dev-agent patched it reactively with `<Compile Remove="Tasks\obj\**"/>` (scenario-specific, hardcodes "Tasks").

## Special APIs
- **ActivitySensorTrigger + BackgroundTaskBuilder** wired per the Background Tasks pattern; runtime gated by background-access/sensor policy on a sensorless box → unverifiable, flagged manual review (not a defect).

## Dev-agent struggles
- 2 failed builds on CS0579 before success. **Preventable by** excluding `bin/obj/.vs/.git` from the Initialize copy step (Tier-1), so the stale artifacts never reach the project.

## Env
- Sensorless machine → `GetDefaultAsync()` null → no-sensor message everywhere (faithful to UWP).
