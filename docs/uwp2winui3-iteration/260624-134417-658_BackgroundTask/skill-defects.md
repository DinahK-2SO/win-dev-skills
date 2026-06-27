# Skill defects — BackgroundTask (WILL change skill)

1. **`winapp build` is not a real command** (wrong text). Log turn 63: `'build' was not
   matched`. Referenced in SKILL.md Step 3/4 + build-discipline note, the validator
   header, and MIGRATION-PATTERNS WUI section. Fix: replace all with `dotnet build`.
   *Generalizes:* every scenario ends with a compile/confirm step.

2. **Copied `Properties/AssemblyInfo.cs` → CS0579 duplicate attributes** (absent). Log
   turns 56-59. SDK-style projects auto-generate assembly attributes
   (`GenerateAssemblyInfo=true`), colliding with the copied file. Fix: add a
   MIGRATION-PATTERNS section telling the agent to delete copied AssemblyInfo.cs.
   *Generalizes:* every UWP project ships Properties/AssemblyInfo.cs.

3. **Background-task / app-service `<Extension>` manifest entries → 0x80080204 deploy
   failure** (absent). Log turns 60-61. In-process WinRT EntryPoint without
   ActivatableClassId is rejected. Fix: add manifest-checklist item 5 — drop the
   `<Extension>` block for structural migrations (or author the activatable-class
   registration). *Generalizes:* in-process background tasks/app services are a common
   UWP manifest pattern.
