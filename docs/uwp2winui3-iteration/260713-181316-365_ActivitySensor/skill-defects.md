# Skill defects — ActivitySensor (WILL change skill)

## 1. No guidance to align the scaffold namespace with the UWP source `<RootNamespace>` (build-blocking CS0118)

- **Evidence:** `winui_build='FAILED (CS0118 ... + XAML WMC9999)'`; `builds=false`,
  `timeout=true`. Migrated shell files (`App`/`MainWindow`/`MainPage`) sit in
  `namespace ActivitySensor`; ported scenario pages sit in `namespace SDKTemplate` and
  reference `Windows.Devices.Sensors.ActivitySensor` unqualified. `.uwp-source` csproj:
  `<RootNamespace>SDKTemplate</RootNamespace><AssemblyName>ActivitySensor</AssemblyName>`.
- **Skill state:** absent. Step 0 = `dotnet new winui -n <ProjectName>` with no rule about
  the project name / RootNamespace / shell-file namespaces; PATTERNS.md "Common build
  errors" covers CS0104/CS0227/CS0246 but not CS0118.
- **Root cause:** the scaffold's root namespace (project name) both mismatches the ported
  pages and shadows the like-named WinRT type.
- **Fix:**
  1. `Initialize-UwpMigration.ps1` — align target csproj `<RootNamespace>` + scaffold
     shell files to the source `<RootNamespace>`.
  2. `MIGRATION-PATTERNS.md` — add a CS0118 build-error entry.
  3. `SKILL.md` Step 0 — one-line single-root-namespace rule.
- **Generalizes:** the whole Windows-universal-samples family uses `SDKTemplate` for page
  code but is named after the demonstrated API; API-name project scaffolds reproduce this
  split and, when the name equals a referenced WinRT type, the CS0118 shadowing failure.
