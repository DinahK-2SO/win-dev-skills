# Skill coverage gaps — will change the skill (sharpen existing content)

## 1. DataTemplate + x:Bind requires x:DataType (WMC1111)
- **Problem:** a `DataTemplate` using `x:Bind` must declare `x:DataType`; missing it →
  WMC1111.
- **Covered at:** MIGRATION-PATTERNS.md '### `x:Bind` and compiled bindings' — mentions
  x:Bind generally and XLS0414/MC3074 but not the DataTemplate x:DataType rule.
- **Why missed:** under-emphasized.
- **Improvement:** add one sentence stating the DataTemplate x:DataType requirement and
  that the DataType must resolve via `local:` (a casualty of the SDKTemplate mismatch).
- **Generalizes:** x:Bind in item templates is ubiquitous in SDK-sample scenario lists.
