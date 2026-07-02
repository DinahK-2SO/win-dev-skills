# Lessons — AdvancedCasting (index 1)

**Outcome:** score 0.0, builds=false, runs=false. All 6 features FAIL solely because the migrated WinUI 3 app does not build.

## The one error that sank the trial
`CS5001` (no static `Main`) + `WMC1509` (No LocalAssembly during MarkupCompilePass2) + `WMC9999` ("Object reference not set…", XAML markup compiler internal error) — all three fire **together** from a single root cause.

- **Root cause:** the `.csproj` `<DefineConstants>` contained `DISABLE_XAML_GENERATED_MAIN` with **no** hand-written `Program.cs`/`Main`. That constant suppresses the SDK's auto-generated `App.g.i.cs` `Main`; pass 2 then runs without a `LocalAssembly` (WMC1509), the compiler crashes (WMC9999), and no entry point is emitted (CS5001).
- **Proven deterministically:** injecting only that constant into a clean `dotnet new winui` scaffold reproduced all three messages verbatim; deleting it restored `Build succeeded`.
- **Trap:** `WMC9999 "Object reference not set to an instance of an object"` is opaque and points at the XAML compiler — an agent naturally (and wrongly) chases a XAML file bug.

## Tool notes
- `dotnet new winui` (helpful): the stock template builds and never needs `DISABLE_XAML_GENERATED_MAIN`.
- `Validate-UwpMigration.ps1` (limited): surfaced the raw error lines but offered no interpretation of the entry-point/XAML-compiler signature.

## Prevention
1. Validator should map the `CS5001 + WMC1509 + WMC9999` signature to the `DISABLE_XAML_GENERATED_MAIN`-without-`Main` root cause and print the fix.
2. `MIGRATION-PATTERNS.md` build-error catalog should document the signature so the agent does not misread `WMC9999` as a XAML bug.
