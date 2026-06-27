# Lessons — BackgroundTransfer (UWP → WinUI 3)

**Outcome:** score 100, builds ✅, runs ✅, 7/7 features pass. A clean migration — the
only real friction was one build failure that recurs across UWP samples.

## Key error (generalizable)
- **CS0579: Duplicate `AssemblyCompany/Configuration/FileVersion/Product/Title/Version`
  attribute** (6 errors, build failed at session-log line 6883).
  - **Root cause:** the UWP source's `Tasks\Properties\AssemblyInfo.cs` (with
    `[assembly: AssemblyTitle]`, `[assembly: AssemblyVersion]`, …) was copied into the
    migrated tree. SDK-style projects auto-generate those same attributes
    (`GenerateAssemblyInfo` defaults to **true**), so the two collide.
  - **Fix applied:** agent added `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>`.
  - **Cleaner/more general fix:** don't copy legacy `AssemblyInfo.cs` at all — the SDK
    regenerates it. Mirrors the existing `bin/obj` copy-skip that prevents CS0101.

## Tool friction
- Piping a live `dotnet build` through `Where-Object { $_ -match 'error|warning…' }`
  made the build *appear* to hang ~8 min; agent had to stop + re-run unfiltered.

## Environment (not a defect)
- Blank screenshots (PrintWindow can't capture WinUI 3 DirectComposition; no interactive
  desktop) and UWP CoreWindow UIA not enumerable. Fidelity verified via UIA tree.

## Helpful tools
- `Initialize-UwpMigration.ps1` (verbatim copy + namespace rewrite) and
  `Validate-UwpMigration.ps1` (clean PASS signal) both worked well.
