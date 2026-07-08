# Lessons — PowerGrid (UWP→WinUI 3), iteration 1

**Outcome:** clean migration. Build 0 errors, app launches, score 100/100 (2/2 features pass). No parity defects. One real skill-defect surfaced in the build log.

## Tools that helped
- **Initialize-UwpMigration.ps1** — bootstrap scaffolded the project + seeded mapping/TODO markers (BOOTSTRAP_EXIT=0).
- **Validate-UwpMigration.ps1** — one-shot gate returned PASS (residue grep, manifest, dotnet build 0 WUI warnings, smoke launch, text fidelity).
- **dotnet build with exit sentinel** — clean builds; `"BUILD_EXIT=$LASTEXITCODE"` gave a reliable final line.

## Tools that were problematic
- **`winapp build`** — DOES NOT EXIST. SKILL.md tells the agent to run it; it failed hard (exit 1, "'build' was not matched", full usage dump). winapp's own help lists init/restore/update/package/sign/cert/manifest/create-debug-identity/run/ui — no `build`.

## Doc errors (skill text that is wrong)
- **SKILL.md L126/L140/L173** instruct `winapp build` to compile. Compilation is `dotnet build`; winapp does not compile (SKILL.md L14 itself says winapp is a packaging/identity/run CLI).
- **MIGRATION-PATTERNS.md L726** attributes analyzer injection to "the benchmark's `winapp build`" — it is injected at `dotnet build` time by the WindowsAppSDK NuGet reference.

## Special APIs
- **Windows.Devices.Power.PowerGridForecast** — WinRT runtime API, no XAML surface; ported verbatim and works on WinUI 3 desktop as-is. Empty forecast on this machine is the genuine runtime state.

## Dev-agent struggles
1. **`winapp build` failed** (1 wasted turn) → recovered with `dotnet build`. Preventable by fixing the SKILL text.
2. **Validate script path** — first tried the copy under `<Target>\.github\skills` (didn't exist), retried at `<app>\.github\skills`. SKILL.md uses `<skill-root>` correctly → dev-agent slip, no skill change.
