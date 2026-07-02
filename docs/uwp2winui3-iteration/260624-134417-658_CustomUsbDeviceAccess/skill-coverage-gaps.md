# Skill coverage gaps — will change skill

## 1. x:Bind / x:DataType type resolution vs. root-namespace consistency
- **Problem:** `WMC0909 Cannot resolve DataType` + `WMC1111` + `WMC9999` internal
  compiler error when the project's root namespace is left inconsistent (SDK sample's
  `SDKTemplate` vs project name `CustomUsbDeviceAccess`).
- **Evidence:** migration-score.json build_error; `MainPage.xaml.cs`/`SampleConfiguration.cs`
  = `SDKTemplate`, `Scenario*.cs` = `CustomUsbDeviceAccess`.
- **Covered at:** `MIGRATION-PATTERNS.md` "### x:Bind and compiled bindings" — currently
  only mentions XLS0414/MC3074 from stale UWP prefixes.
- **Why missed:** under-emphasized (doesn't cover the WMC codes or the namespace-drift
  cause).
- **Improvement:** add WMC0909/WMC1111/WMC9999 + rule: keep `namespace`, `x:Class`,
  `xmlns:local="using:..."` consistent; don't partially rename the SDK sample root
  namespace. x:Bind resolves types by CLR namespace.
- **Generalizes:** all UWP SDK samples share the `SDKTemplate` root namespace differing
  from the scaffold's project name; any x:Bind DataTemplate breaks identically on partial
  reconciliation.
