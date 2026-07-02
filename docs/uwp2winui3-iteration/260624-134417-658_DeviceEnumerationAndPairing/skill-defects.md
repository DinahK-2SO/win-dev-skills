# Skill defects (skill absent/wrong → WILL change skill)

## 1. CS0579 duplicate assembly attributes from legacy `AssemblyInfo.cs` — ABSENT
- **Evidence:** 2nd failed build (session-log 6300-6331) — 6× `CS0579` for
  AssemblyCompany/Configuration/FileVersion/Product/Title/Version in the SDK-generated
  `*.AssemblyInfo.cs`; agent fixed with `<Compile Remove="Tasks\Properties\AssemblyInfo.cs"/>`.
- **Skill state:** grep for `CS0579|AssemblyInfo|GenerateAssemblyInfo` → no matches.
- **Root cause:** Initialize copies every `.cs`; classic `Properties/AssemblyInfo.cs`
  collides with the SDK's auto-generated attributes (`GenerateAssemblyInfo=true`).
- **Fix (Tier 1):** Initialize-UwpMigration.ps1 skips `*AssemblyInfo.cs` on copy,
  preserves a reference under `.uwp-source/`; document CS0579 in Common build errors.
- **Generalizes:** every classic UWP project (and each sub-project) ships an
  `AssemblyInfo.cs`; SDK-style WinUI 3 always auto-generates these → recurs everywhere.

## 2. WMC XAML errors that are a cascade from a C# compile failure — ABSENT
- **Evidence:** 1st failed build (session-log 5851-5896) showed CS0246 + WMC0909
  "Cannot resolve DataType local:Scenario" + WMC1111 + WMC9999. MainPage.xaml already had
  the correct `x:DataType` and was never re-edited; the WMC errors cleared once the
  CS0246 was fixed (green build 6807).
- **Skill state:** only a brief x:Bind note about XLS0414/MC3074 stale prefixes; nothing
  about the C#-failure cascade or WMC0909/WMC1509.
- **Root cause:** a failed C# compile gives MarkupCompilePass2 no LocalAssembly
  (WMC1509), so all project-local `x:Bind`/`x:DataType` types fail to resolve.
- **Fix (Tier 3):** Common-build-errors note — fix CS#### first and rebuild before
  editing XAML; WMC1509 "No LocalAssembly parameter" is the tell.
- **Generalizes:** app-local `x:Bind`+`x:DataType` is ubiquitous in these samples; any
  transient C# failure surfaces these phantom XAML errors.
