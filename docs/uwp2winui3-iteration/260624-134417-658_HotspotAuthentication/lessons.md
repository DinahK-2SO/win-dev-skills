# Lessons — HotspotAuthentication (UWP → WinUI 3)

Outcome: **score 100/100**, builds ✅, runs ✅, all 3 scenarios pass. Clean migration; one
build-blocking error along the way.

## Key error (root cause → fix)
- **CS0579 duplicate assembly attribute (×12).** The UWP project's hand-authored
  `Properties\AssemblyInfo.cs` (standard VS boilerplate: `AssemblyTitle`, `AssemblyCompany`,
  `AssemblyConfiguration`, `AssemblyVersion`, `AssemblyFileVersion`, `ComVisible`, …) was
  copied into the target and compiled by the SDK-style WinUI 3 csproj, which **by default
  (`GenerateAssemblyInfo=true`) emits the same attributes** into
  `obj\…\<Project>.AssemblyInfo.cs`. Two copies of each attribute ⇒ CS0579.
  - Dev-agent fix: added `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>` to the csproj.
  - Cleaner equivalent: delete the superseded legacy `AssemblyInfo.cs`.

## Tools
- **Helpful:** `Initialize-UwpMigration.ps1` (namespace rewrite + source copy + `.uwp-source`
  reference), `Validate-UwpMigration.ps1` (final completeness gate).
- **Limitation:** the bootstrap copies **every** legacy `.cs`, including
  `Properties\AssemblyInfo.cs`, which is exactly what triggers CS0579. It already excludes
  ILC `*.g.cs` for the analogous duplicate-type reason — `AssemblyInfo.cs` deserves the same.

## Non-issues
- Nullable warnings (CS8618 etc.) from the scaffold's `<Nullable>enable</Nullable>` on ported
  code — non-blocking, inherent, not a defect.
- Hotspot APIs are hardware/event-gated (Authenticate/Skip/Abort disabled until a live event);
  migrated as-is with no WinUI-specific change. Correct behavior, matches UWP.
