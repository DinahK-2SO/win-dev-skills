# Lessons — BackgroundTask (UWP→WinUI 3)

Score: **100/100** (6/6 pass). Build clean. App launches. All discrepancies were
environment/eval-side, not migration defects. The value here is in the **dev-agent
struggles** mined from the build log.

## What worked
- **Validate-UwpMigration.ps1** — one-shot gate caught the manifest deploy failure and
  confirmed PASS after the fix (smoke launch pid 14104).
- **Get-MigrationPattern.ps1 threading anchor** — clean `Dispatcher.RunAsync` →
  `DispatcherQueue.TryEnqueue` across all 6 scenarios.

## Errors encountered (root cause → fix)
1. **CS0579 Duplicate assembly attributes** (turns 56-59) — copied UWP
   `Tasks/Properties/AssemblyInfo.cs` collided with SDK auto-generated attributes
   (`GenerateAssemblyInfo=true`). Fix: delete the copied AssemblyInfo.cs. 6 errors → 0.
2. **Manifest 0x80080204** (turns 60-62) — `windows.backgroundTasks <Extension>`
   EntryPoint without `ActivatableClassId`. Fix: remove the manifest extension blocks.
3. **`winapp build` not a command** (turn 63) — SKILL.md prescribes `winapp build`, but
   the CLI has no `build` verb (`'build' was not matched`). Fix: `dotnet build`.

## Doc errors
- `winapp build` referenced in SKILL.md (Step 3, build-discipline note, Step 4), the
  validator header, and MIGRATION-PATTERNS WUI section — all wrong; should be
  `dotnet build`.

## Special handling
- In-process background-task / app-service `<Extension>` manifest entries must be
  dropped (or given a full WinRT activatable-class registration) for a packaged WinUI 3
  app to deploy.

## Env issues (eval-side, not migration)
- Behavioral actuation + screenshots blocked on both apps (empty UWP UIA tree, no
  interactive desktop, blank WinUI swapchain capture). Scoring used structural UIA
  comparison; flagged for manual review.
