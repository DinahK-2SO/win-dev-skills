# Skill Defects (skill absent/wrong → WILL change skill)

## 1. Misleading WMC XAML cascade from a C# compile failure (absent)
- **Problem:** A CS0234 code-behind error caused the markup compiler to emit WMC0909/WMC1111/WMC1509/WMC9999 against correct `x:Bind`/`x:DataType`. Agent misdiagnosed and downgraded `{x:Bind}`+`x:DataType` to `{Binding}`.
- **Evidence:** session-log.txt:2557-2627 (mixed CS + WMC errors in one build); session-log.txt:2652 (x:Bind → Binding downgrade).
- **Skill state:** absent. x:Bind section (MIGRATION-PATTERNS.md:622-624) only covers XLS0414/MC3074 from stale namespace prefixes — a different cause. No mention of the WMC cascade or fix-C#-first ordering.
- **Fix:** Add guidance: WMC-series errors usually cascade from a C# compile failure → fix all `CS####` errors first, rebuild, then re-judge; never downgrade x:Bind to Binding to silence them.
- **Generalizes:** x:Bind DataTemplates + any code-behind error is a common combination across scenarios; the ordering rule prevents a whole class of misdiagnoses and compiled-binding regressions.
