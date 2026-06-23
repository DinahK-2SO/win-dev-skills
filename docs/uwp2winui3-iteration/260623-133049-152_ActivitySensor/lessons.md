# Lessons — ActivitySensor (UWP → WinUI 3)

Final outcome: **score 100/100, 4/4 features pass, builds + runs**. No parity defects.
All value here is in *how* the dev-agent got there — two multi-turn build/launch struggles
that are generalizable and preventable.

## Tools
- **Helpful:** `Initialize-UwpMigration.ps1` (scaffold seed + namespace rewrite + mapping),
  `Validate-UwpMigration.ps1` (residue/build/smoke gate), `Test-AppLaunch.ps1` (surfaced
  exact AppX manifest validation errors).
- **Problematic:** `Initialize-UwpMigration.ps1` copies *every* `.cs` recursively from the
  UWP source — including `obj/`, `bin/` generated files and `Properties/AssemblyInfo.cs`.

## Errors → root cause → fix
1. **CS0579 Duplicate `TargetFrameworkAttribute`** (turn 37) — stale
   `Tasks\obj\...\.NETCore,Version=v5.0.AssemblyAttributes.cs` got compiled because the
   SDK-style WinUI csproj auto-globs `**/*.cs`. Root cause: copy step pulled in build
   artifacts. Fixed by manual delete + `<Compile Remove>` (turns 42-43).
2. **CS0246 `MainPage` not found** (turn 44) — scaffold `MainWindow` navigates to
   `MainPage`, which kept the sample's `SDKTemplate` namespace. Fixed with `using
   SDKTemplate;` (turn 45).
3. **WMC0909/WMC1111 DataTemplate `local:Scenario`** (turn 44) — `x:Bind` DataTemplate
   against a project type failed MarkupCompilePass2 (WMC1509 no LocalAssembly). Worked
   around with `{Binding Title}` (turn 46).
4. **AppX 0x80080204 then 0xC00CE169** (turns 48-57) — in-process background task:
   `Application.OnBackgroundActivated` doesn't exist in WinUI 3 (CS0246), and
   `windows.activatableClass.inProcessServer` must be a **package-level** manifest
   extension, not nested under `<Application>`. Fixed across turns 50-55.

## Highest-leverage struggles (preventable)
- **Build artifacts copied** (~6 turns) → fix at the `Initialize-UwpMigration` copy step.
- **In-process background task wiring** (~9 turns, 3 failed launches) → add a concrete
  manifest + `OnBackgroundActivated` subsection to MIGRATION-PATTERNS.md.

## Environment (non-defect)
Headless session: WinUI composition screenshots blank; UWP CoreWindow exposed no XAML UIA
tree, so per-scenario UWP behavioral baseline unavailable. Eval-side limitation only.
