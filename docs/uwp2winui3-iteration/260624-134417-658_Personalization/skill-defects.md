# Skill defects — Personalization (WILL change skill)

## 1. Bootstrap does not reconcile the sample's root namespace (SDKTemplate → project namespace)
- **State:** absent. The only namespace handling in the skill is the
  `Windows.UI.Xaml → Microsoft.UI.Xaml` rewrite (`Initialize-UwpMigration.ps1` line 126).
  Nothing reconciles `SDKTemplate` → the scaffold `RootNamespace`.
- **Evidence:** bootstrap reported only "Rewrote Windows.UI.Xaml -> Microsoft.UI.Xaml in
  2 of 8 files"; dev-agent then hand-edited `namespace SDKTemplate`, `x:Class="SDKTemplate.*"`,
  and `xmlns:local="using:SDKTemplate"` across SampleConfiguration.cs, MainPage.xaml(.cs),
  SetLockScreenImage.xaml (log lines 1409-1432).
- **Fix:** new bootstrap step 3a — detect dominant source base namespace, rewrite it to the
  target `RootNamespace` across all copied `.cs/.xaml`.
- **Generalizes:** all Windows-universal-samples ship as `SDKTemplate`; `dotnet new winui -n X`
  always uses `X`. Reconciliation is an every-scenario mechanical step; a miss → WMC0909/CS0246.
