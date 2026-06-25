# Skill Defects — AssociationLaunching

## 1. `winapp build` is not a real winapp command (SKILL.md L126/L138/L170)
- **Evidence:** session-log TURN 30-31 — `winapp build` → `'build' was not matched`, exit 1, winapp help dump (no `build` verb).
- **State:** wrong. winapp offers `run`/launch only; compilation is `dotnet build`.
- **Fix:** replace `winapp build` with `dotnet build -c Debug; "BUILD_EXIT=$LASTEXITCODE"` everywhere in SKILL.md; correct the stale reference in Validate-UwpMigration.ps1 header.
- **Generalizes:** the compile step is the same for every migration; every agent hits this.
