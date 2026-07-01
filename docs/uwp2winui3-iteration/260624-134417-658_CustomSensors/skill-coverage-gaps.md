# Skill coverage gaps — CustomSensors (both WILL change skill)

## 1. Nullable warning wave under nullable-enabled scaffold
- **Evidence:** T34 build → 16× CS8618/CS8625 across SampleConfiguration.cs and both
  Scenario*.xaml.cs (e.g. `private CustomSensor customSensor;`, `= null`). Agent cleaned
  up over T29 + T38.
- **Covered at:** MIGRATION-PATTERNS.md:186 — a single inline comment scoped to
  `App.MainWindow`.
- **Why missed:** under-emphasized; reads as a windowing detail, not a project-wide rule.
- **Fix:** promote to a short general "Nullable reference types" note listing the
  recurring warnings + standard fixes.
- **Generalizes:** every migration inherits `<Nullable>enable</Nullable>` over
  nullable-disabled UWP source → this wave recurs everywhere.

## 2. x:Bind to const/static → CS0176
- **Evidence:** T34 `MainPage.g.cs(146,50): error CS0176: FEATURE_NAME cannot be accessed
  with an instance reference`; hard build error. Fixed via instance wrapper at T36.
- **Covered at:** MIGRATION-PATTERNS.md:683-685 (`### x:Bind and compiled bindings`) —
  only names the namespace/type-not-found failure mode.
- **Why missed:** not prominent; section silent on static/const binding.
- **Fix:** one sentence — static/const x:Bind targets need type-qualification or an
  instance wrapper (CS0176).
- **Generalizes:** SDK sample template declares `FEATURE_NAME` const + other statics used
  across many scenarios.
