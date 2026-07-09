# Skill defects (skill absent/wrong → WILL change skill)

## 1. CS0103 `App` does not exist — SDKTemplate vs root namespace split
- **Evidence:** `session-log.txt` L2360-2364 (5 build errors); fixed turn 31 with
  `using RelativeInclinometer;`. `App.xaml.cs` = `namespace RelativeInclinometer;`
  (`x:Class="RelativeInclinometer.App"`); `MainPage.xaml.cs` / `SampleConfiguration.cs`
  = `namespace SDKTemplate`.
- **Skill search:** `SDKTemplate`, `CS0103`, `RootNamespace`, `App class` → **0 hits**
  in SKILL.md, MIGRATION-PATTERNS.md, scripts/*.
- **State:** absent.
- **Root cause:** Windows-universal-samples keep shared scaffolding in
  `namespace SDKTemplate` and reference `App` unqualified; `dotnet new winui` puts `App`
  in the project **root** namespace. The split leaves `App.*` unresolved.
- **Fix:** New "Common build errors" entry documenting the CS0103 `App` error + two
  reconciliation options (add `using <RootNamespace>;`, or move scaffold `App` into
  `namespace SDKTemplate`).
- **Generalizes:** Recurs on essentially every SDK-sample migration (the whole sample
  family uses `SDKTemplate`).
