# Lessons — CameraOpenCV (UWP → WinUI 3), iteration 0

**Outcome:** score 100, builds ✓, runs ✓, 1/1 feature pass. The migration succeeded, but
the transcript exposes one high-value, *generalizable* struggle.

## Headline struggle — native WinRT component dependency
The UWP C# app referenced a **native C++/CX WinRT component** (`OpenCVBridge.vcxproj`,
via `..\shared\OpenCVBridge\OpenCVBridge.vcxproj`) that provided the `OpenCVHelper` image
-processing types. For ~9 turns the agent hand-explored the solution, read the native
header, listed the built artifacts, and even **hand-wrote a PE-header parser** to confirm
the DLL's `DllCharacteristics` (`0x1160` → `IsAppContainer:True`) before concluding it
could not load in a WinUI 3 desktop process. It then replaced it with managed
**OpenCvSharp4** and re-implemented `OpenCVHelper.cs`.

- **Root cause:** the migration skill has no guidance for *"a C# UWP app depends on a
  native WinRT component"*, and the bootstrap preserves the UWP `.csproj` but never scans
  it for native `.vcxproj` `ProjectReference`s — so the dependency was invisible.
- **General rule:** a prebuilt native (C++/CX or C++/WinRT) WinRT component is
  AppContainer-flagged and will not load in a Full-Trust desktop app. Either rebuild the
  component for desktop or replace it with a managed equivalent and re-implement the
  projected helper types. This is common in Windows-universal-samples (shared native
  helpers) and other UWP apps with C++ acceleration components.

## Errors encountered (library-specific, not migration concerns)
- `CS0619` obsolete `Mat(...)` ctor → `Mat.FromPixelData` (OpenCvSharp4 version churn).
- `CS1061` `MatExpr.Rows/Cols` → materialize `MatExpr` to `Mat` (OpenCvSharp4 API shape).
- `CS1519` stray brace → one-off typo.
All three are OpenCvSharp4/authoring details the agent fixed unaided; not skill gaps.

## What already worked
- Bootstrap (`Initialize-UwpMigration.ps1`) drove the file-by-file migration.
- Camera preview handled as an *adaptable* feature with a device-unavailable fallback,
  per the `#capture` pattern + the Defensive-UI rule — verified live by the score trial.
