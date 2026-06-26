# Lessons — BackgroundSensors (UWP → WinUI 3)

**Outcome:** score 100, full parity, build + run OK. The only real friction was a build-breaking
duplicate-AssemblyInfo error that recurs on essentially every UWP migration.

## Errors encountered
- **CS0579 Duplicate `AssemblyXxxAttribute` (x6)** — root cause: the migration copied the UWP
  `Properties\AssemblyInfo.cs` (`[assembly: AssemblyTitle/Company/Configuration/Product/Version...]`)
  into an SDK-style WinUI project, whose `GenerateAssemblyInfo` default (`true`) auto-generates the
  same attributes. Multi-project sample brought a second `BackgroundTask\Properties\AssemblyInfo.cs`,
  multiplying the dupes. Fixed in the trial with `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>`.
- **Nullable warnings** on background-task fields — scaffold enables `<Nullable>enable</Nullable>`,
  UWP fields aren't null-annotated. Fixed with `?` + null-conditional. Already covered by
  MIGRATION-PATTERNS.md.

## Dev-agent struggles
- Turns 39–43: first build failed on 6× CS0579; diagnosed and fixed in ~1 cycle. Preventable by the
  scaffolding script not copying `Properties\AssemblyInfo.cs` at all.

## Special APIs
- `DeviceUseTrigger`, `BackgroundTaskBuilder`, `Accelerometer` run unchanged but are hardware-gated
  (no accelerometer ⇒ `No accelerometer found` in both apps) and emit CA1416 platform-compat
  warnings (warnings only — build succeeds).

## Env
- WinUI 3 client-area screenshot captured blank (PrintWindow limitation). Eval fell back to the UIA
  tree. This is an eval-skill capture artifact, not a migration-skill defect (out of scope).
