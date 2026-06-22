# Dev-Agent Slips (skill already clear → do NOT change skill) — ActivitySensor

### 1. DataTemplate x:Bind/x:DataType transient failure
- **Evidence:** turn 36 `WMC0909 Cannot resolve DataType local:Scenario`; fixed in one edit (turn 37) by switching to `{Binding Title}`.
- **Covered clearly at:** `MIGRATION-PATTERNS.md` `### x:Bind and compiled bindings` (~line 576).
- **Slip type:** one-off mistake (side effect of the in-progress RootNamespace rename).
- **Why no skill change:** x:Bind support is documented and resolving a DataTemplate binding is standard WinUI knowledge a capable model handles in one turn.
