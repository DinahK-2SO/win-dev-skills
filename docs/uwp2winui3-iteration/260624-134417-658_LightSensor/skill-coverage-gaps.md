# Skill coverage gaps (present but unclear → WILL change skill)

Both items share one general root cause: **Windows-universal-samples keep code across
multiple namespaces (`SDKTemplate` + a per-project namespace) that differ from the
scaffold's project-root namespace.** Cross-references break unless kept consistent /
fully qualified.

## 1. CS0103 `The name 'App' does not exist` — cross-namespace static window reference
- **Evidence:** session-log 2631-2642 (CS0103 ×4); final workaround `LightSensor.App.MainWindow!`.
  Scenario pages are `namespace LightSensorCS`; `App` is `namespace LightSensor`.
- **Covered at:** `MIGRATION-PATTERNS.md` #windowing — but every example writes `App.MainWindow`
  unqualified, implicitly same-namespace.
- **Why missed:** under-emphasized; the split-namespace pitfall is never stated.
- **Fix:** add a prominent caveat — scaffold `App`/`MainWindow` are in the project ROOT
  namespace; sample pages keep their own, so reference the static as
  `<RootNamespace>.App.MainWindow` (or add `using <RootNamespace>;`). Map CS0103 on `App`.
- **Generalizes:** every sample that replaces `Window.Current` from a scenario page hits this.

## 2. WMC0909 `Cannot resolve DataType local:Scenario` — x:Bind DataType namespace mismatch
- **Evidence:** session-log 2645-2646 (WMC0909 + WMC1111 on MainPage.xaml).
- **Covered at:** #x:Bind-and-compiled-bindings + SKILL.md Step 3 shell conversion — but only
  mentions *stale UWP* prefixes, not the same-project `.NET` namespace split.
- **Why missed:** ambiguous; x:Bind failure from an `xmlns:local` ↔ model-namespace mismatch
  isn't called out.
- **Fix:** keep the shell page's `x:Class`/`xmlns:local` consistent with the namespace of the
  model types its `x:DataType`/`x:Bind` reference. Note WMC0909/WMC1111 as the symptom.
- **Generalizes:** every SDK-sample MainPage binds a `Scenario` model in `SDKTemplate`.
