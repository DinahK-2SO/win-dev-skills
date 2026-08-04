# Skill defects — will change the skill

## 1. SDK-sample `SDKTemplate` namespace mismatch cascade (ABSENT)
- **Problem:** SDK samples fix every class in `namespace SDKTemplate` with
  `x:Class="SDKTemplate.MainPage"`; the scaffold (`dotnet new winui -n <ProjectName>`)
  puts App/MainWindow under the project namespace. Mismatch → **CS0246 MainPage** +
  **WMC0909 / WMC1111 / WMC1509** XAML type-resolution errors.
- **Evidence:** build-events.jsonl 16628/16630; session-log turns 46–52 (agent theorized
  about x:DataType/LocalAssembly for several turns before finding the namespace mismatch;
  fixed with `using SDKTemplate;` in MainWindow.xaml.cs).
- **Skill state:** absent (SDKTemplate / WMC0909 / WMC1509 appear nowhere).
- **Fix:** add a subsection to the SDK-sample NavigationView+Frame area warning about the
  `SDKTemplate` namespace convention, the CS0246+WMC symptom signature, and the two valid
  reconciliations (keep SDKTemplate + `using SDKTemplate;` in scaffold files, or rename
  consistently to the project namespace).
- **Generalizes:** every Windows-Universal-Samples C# app uses `SDKTemplate`; the cascade
  recurs whenever the scaffold name differs.
