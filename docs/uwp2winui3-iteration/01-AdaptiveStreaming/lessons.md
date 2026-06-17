# Lessons — AdaptiveStreaming (Iteration 1)

## Outcome
- **Score**: 0 (timeout — harness killed before final parity pass)
- **Actual progress**: App built, ran, achieved 57.1/100 parity (4 pass, 3 fail) before timeout
- **Total turns**: 116 (29 migration + 87 parity)
- **Root cause of failure**: 40 turns wasted on subst-drive package registration issue

## Key Struggles

### 1. Subst Drive Incompatibility (40 turns wasted)
The benchmark environment maps `B:` via `subst` to `C:\ado\win-dev-skills-benchmark`.
Windows package registration (`Add-AppxPackage` / `winapp run`) cannot resolve subst drives,
returning `0x80070003` ("file not found"). The agent tried:
- Shortening output paths
- Explicit layout paths
- Different `winapp` invocations
- `create-debug-identity`

**Resolution**: Discovered `subst` output at turn 47; switched `OutputPath` to `C:\ado\w\o\`.

**Prevention**: `Test-AppLaunch.ps1` should detect subst drives and auto-resolve, or the
skill guidance should warn about this known limitation.

### 2. MediaPlayerElement AutomationId Not Exposed via UIA (~20 turns)
`MediaPlayerElement` does not surface `AutomationProperties.AutomationId` through UIA.
The parity checker marks scenarios as `fail` when it can't find the named control.

**Resolution**: Wrapped `MediaPlayerElement` in a `<Grid AutomationProperties.AutomationId="...">`.

**Prevention**: Document this in the parity skill, or have the checklist extractor skip
MediaPlayerElement from name-based detection.

### 3. Source Path Discovery (5 turns)
The prompt hint `../../../uwp-samples-standalone` didn't resolve from the agent's working
directory. Agent had to manually search parent directories.

**Prevention**: Provide absolute path in prompt or have the bootstrap script search.

### 4. App Dies Before Capture (3 turns)
First successful launch (PID 9404) exited before the capture script connected.

**Prevention**: Combine launch + capture into a single atomic operation.

## Tools That Worked Well
- `Initialize-UwpMigration.ps1` — efficient bulk setup
- `Get-MigrationPattern.ps1` — clear threading guidance
- `Capture-AppScenarios.ps1` — reliable once app was alive
- `Compare-Parity.ps1` — actionable granular feedback

## Environment Issues
| Issue | Impact | Workaround |
|-------|--------|------------|
| B: is subst drive | Package registration fails | Output to C:\ path |
| Trial path ~180 chars | MAX_PATH for intermediate files | Short BaseIntermediateOutputPath |
