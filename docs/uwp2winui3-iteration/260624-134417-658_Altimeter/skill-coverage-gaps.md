# Skill coverage gaps — Altimeter (WILL change skill)

## 1. `0xC000027B` startup-crash guidance omits the XAML-load cause (under-emphasized)
- **Problem:** The crash was a XAML-load failure (`RelativePanel.Below="SampleTitle"` targeting an element in another panel), faulting module `Microsoft.UI.Xaml.dll`. The skill's `0xC000027B` row only says "legacy projection/activation incompatibility ... defer the API".
- **Evidence:** session-log Turns 48–52: smoke-launch FAIL `0xc000027b`; event 1000 → `Microsoft.UI.Xaml.dll`; agent moved `SampleTitle` into the RelativePanel → PASS.
- **Covered at:** MIGRATION-PATTERNS.md > `Diagnosing Startup Crashes` > native-codes table, `0xC000027B` row.
- **Why missed:** under-emphasized — guidance points only at deferring an API.
- **Improvement:** Extend the row + one prose line: when the faulting module is `Microsoft.UI.Xaml.dll`, 0xC000027B is usually a XAML parse/load failure (cross-panel RelativePanel target, missing resource key, broken MergedDictionary) — inspect the XAML before deferring an API.
- **Generalizes:** The SDK shell uses RelativePanel named references everywhere; XAML-load crashes are a broad WinUI 3 startup failure class.
