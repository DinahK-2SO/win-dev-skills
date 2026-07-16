# Skill defects — CameraOpenCV (WILL change skill)

## 1. No guidance for a C# UWP app that depends on a native WinRT component
- **Problem:** the app referenced `OpenCVBridge.vcxproj` (native C++/CX helper). The
  skill has nothing on native-component `ProjectReference`s; the agent burned ~9 turns
  hand-inspecting the solution and PE-parsing the DLL to prove it was AppContainer-flagged.
- **Evidence:** session-log lines ~1486–2012 (PE `DllCharacteristics=0x1160 → IsAppContainer:True`,
  then "OpenCVBridge.dll is AppContainer-flagged so I'll use OpenCvSharp4 instead");
  UWP csproj `<ProjectReference Include="..\shared\OpenCVBridge\OpenCVBridge.vcxproj">`.
- **Skill search:** grepped SKILL.md / MIGRATION-PATTERNS.md / scripts for
  `ProjectReference|vcxproj|winmd|native|C\+\+|AppContainer|component` → **absent**.
- **Root cause:** skill covers C# source + PackageReference reconciliation, never a native
  ProjectReference; bootstrap preserves but does not parse the UWP csproj for it.
- **Fix:** Tier 1 bootstrap detection + Tier 3 `native-component` pattern (rebuild-or-replace).
- **Generalizes:** native C++ helper components are a recurring UWP pattern (SDK samples +
  production interop); all hit the same AppContainer-load wall on desktop.
