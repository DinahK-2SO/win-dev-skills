# Skill coverage gaps — DisablingScreenCapture (WILL change skill)

## 1. x:Bind DataTemplate over a project-local type (WMC0909/WMC1111)
- **Evidence:** `WMC0909 Cannot resolve DataType local:Scenario` + `WMC1111 DataTemplates containing x:Bind need a DataType` (session-log ~2246). Agent switched `DataTemplate x:DataType="local:Scenario"` + `{x:Bind Title}` to `{Binding Title}` (~2305).
- **Covered at:** `### x:Bind and compiled bindings` (~line 683) — but it only mentions XLS0414/MC3074 namespace issues, not the DataTemplate `x:DataType` project-local resolution failure.
- **Why missed:** under-emphasized — the DataTemplate case and `{Binding}` fallback aren't spelled out.
- **Improvement:** Add one short note to the existing x:Bind section covering WMC0909/WMC1111 and the classic `{Binding}` fallback.
- **Generalizes:** UWP sample shells and list-driven apps routinely use `ListBox/ListView` item templates with `x:DataType="local:..."` + `{x:Bind}` over project-local models.
