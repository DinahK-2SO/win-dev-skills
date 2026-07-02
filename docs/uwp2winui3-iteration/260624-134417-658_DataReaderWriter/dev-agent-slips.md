# Dev-agent-slips — DataReaderWriter (will NOT change skill)

## 1. DataTemplate x:Bind `x:DataType` resolution failure
- **Problem:** WMC0909 'Cannot resolve DataType local:Scenario' + WMC1111 + internal
  WMC9999 on a ported ItemTemplate.
- **Evidence:** `session-log.txt:2236-2238`; fixed at `2299` by switching to `{Binding Title}`.
- **Slip type:** one-off mistake — recovered in a single turn with the standard fallback.
- **Why no skill change:** the trigger is a compiler-internal (WMC9999) quirk, not a
  generalizable pattern; and codifying "prefer {Binding} over x:Bind" would be wrong
  guidance for other scenarios where x:Bind is the recommended default.
