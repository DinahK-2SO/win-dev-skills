# Skill defects — LinguisticServices (index 0)

## 1. `CS0234` / `CS0576` — project name collides with a source type/namespace (ABSENT)

- **Problem:** unqualified references to a source helper type whose name equals the WinUI 3
  project's root namespace fail (`CS0234`), and the obvious `using Alias = …;` fix also
  fails (`CS0576`). ~3 build cycles lost.
- **Evidence:** session-log 4116–4118 (`CS0234 … does not exist in the namespace
  'LinguisticServices'`), 4343–4345 (`CS0576 … conflicting with alias 'LinguisticServices'`),
  4508–4523 (final working fix `using static Sample.LinguisticServices;`). XAML cascade
  4126/4353 (`WMC1509` → `WMC0909 Cannot resolve DataType local:Scenario`).
- **Skill state:** ABSENT. The only CS0234 entry in MIGRATION-PATTERNS.md is about *stale
  bin/obj* duplicate types — a different cause. CS0576 is nowhere in the skill.
- **Root cause:** sample's feature logic is a class named after the sample (`Sample.
  LinguisticServices`); the project is scaffolded with the same name, so root namespace ==
  type name. Bare identifier binds to the namespace, not the class; aliasing to that name
  is illegal.
- **Proposed fix:** new subsection under "Common build errors after the namespace rewrite"
  mapping CS0234/CS0576 to the collision, with the deterministic recipe: `global::` fully-
  qualify **or** `using static`; never an alias equal to the root namespace. Fix C# first —
  the XAML WMC cascade clears with it.
- **Generalizes:** default project naming + same-named helper class in UWP SDK samples
  makes this recur across scenarios regardless of the APIs.
