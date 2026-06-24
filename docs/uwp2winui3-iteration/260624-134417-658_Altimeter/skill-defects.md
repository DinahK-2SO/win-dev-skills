# Skill defects — Altimeter (WILL change skill)

## 1. `required` on XAML-referenced model classes → CS9035 (absent)
- **Problem:** Adding `required` to the SDK `Scenario` model (`Title`, `ClassType`) to silence nullable warnings breaks the build — the XAML source generator emits `new Scenario()` with no initializer (XamlTypeInfo.g.cs) and can't satisfy required members.
- **Evidence:** session-log Turns 38–42: add `required` → `error CS9035: Required member 'Scenario.Title' must be set ... XamlTypeInfo.g.cs(335,59)` → revert to default initializers → build succeeds.
- **Skill state:** absent. 'Common build errors' covers CS0104/CS0227/CS0246 but not CS9035.
- **Fix:** Add a CS9035 subsection: XAML-referenced model types must use default initializers (`= string.Empty;`, `= typeof(object);`) or stay nullable — never `required`.
- **Generalizes:** All UWP SDK samples share `SampleConfiguration.cs`'s `Scenario` class; any migration enabling nullable will hit this. Applies to every XAML-bound model/DTO type.
