# Skill Defects (skill absent/wrong → WILL change skill) — ActivitySensor

### 1. Bootstrap copies stale build output → CS0579 (Tier 1, tooling)
- **Evidence:** turn 29 `Tasks\obj\...\.NETCore,Version=v5.0.AssemblyAttributes.cs … error CS0579 Duplicate TargetFrameworkAttribute`; turn 31 manual `Remove-Item`; validator turn 46 had 208 mapping rows incl. `bin\…\AppX\Assets\*.png`.
- **Skill state:** absent. Copy loop in `Initialize-UwpMigration.ps1` (~line 69) has no bin/obj exclusion, though the rewrite step (~line 106) already defines `$excludeDirs`.
- **Fix:** skip `\bin\`, `\obj\`, `\.vs\`, `\.git\` and legacy `Properties\AssemblyInfo.cs` in the copy loop.
- **Generalizes:** real UWP trees ship bin/obj + AssemblyInfo, and nested helper-project obj isn't covered by SDK default excludes → recurs everywhere.

### 2. RootNamespace collides with a WinRT type name → CS0118 (Tier 3, prose)
- **Evidence:** turns 30-45 repeated `'ActivitySensor' is a namespace but is used like a type`; cleared only after `<RootNamespace>SDKTemplate</RootNamespace>` + `dotnet clean` (stale `XamlTypeInfo.g.cs` held the old namespace).
- **Skill state:** absent. "Common build errors after the namespace rewrite" covers CS0104/CS0227/CS0246 but not CS0118; no mention of RootNamespace/SDKTemplate/dotnet clean.
- **Fix:** add a CS0118 subsection — rename RootNamespace to neutral `SDKTemplate`, keep types in `SDKTemplate`, `dotnet clean` to regenerate `XamlTypeInfo.g.cs`.
- **Generalizes:** WinUI/UWP SDK samples are named after the demonstrated API (Accelerometer, Compass, BarcodeScanner…) → collision recurs across the sample family.
