# Lessons — LinguisticServices (index 0)

**Outcome:** score 100/100, builds ✓, runs ✓, all 4 features pass. The migration was
correct in the end; the value here is the *path* the dev-agent took to get there.

## Headline struggle: project name == source type name (root-namespace collision)

- Source: code-behind is `namespace SDKTemplate`; the business logic is a **static class
  `LinguisticServices` in `namespace Sample`** (methods `RecognizeTextLanguages`,
  `RecognizeTextScripts`, `TransliterateFromCyrillicToLatin`), called via `using Sample;`
  + an unqualified `LinguisticServices.` prefix.
- The WinUI 3 project was **named `LinguisticServices`**, so its root namespace is
  `LinguisticServices`. The bare identifier `LinguisticServices` now binds to the
  project's own root namespace, not the `Sample` class →
  **`CS0234: ... does not exist in the namespace 'LinguisticServices'`**.
- First fix attempt: `using LinguisticServices = Sample.LinguisticServices;` →
  **`CS0576: ... conflicting with alias 'LinguisticServices'`** (an alias may not equal a
  root namespace name).
- The C# failure also cascaded into XAML: `WMC1509` (no LocalAssembly) →
  `WMC0909 Cannot resolve DataType local:Scenario` → `WMC1111`.
- Final fix (worked): `using static Sample.LinguisticServices;` + drop the qualifier at
  every call site. `global::Sample.LinguisticServices.Method(...)` would also work.

Cost: ~3 build/edit cycles that a documented pattern would have collapsed to one.

## Not defects
- Nullable-reference warnings (CS8618/CS8600/CS8602/CS8604) — build still succeeded; not
  worth a skill change.
- Blank WinUI screenshots — disconnected-session environment artifact (UIA tree correct).
