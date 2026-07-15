# Discrepancies — BackgroundMediaPlayback (UWP → WinUI 3)

**Score 0 · builds=false · runs=false · timeout=true**

Both rubric features `fail` for a single reason: the migrated app does not build, so it
never launched and no controls could be captured or compared.

| id | Feature | Status | Reason | Suspected skill gap |
|----|---------|--------|--------|---------------------|
| 0 | Background Media Playback | fail | CS0246 SDKTemplate + WMC9999 → no build/launch | SDKTemplate root-namespace reconciliation undocumented/unguarded |
| 1 | Settings | fail | Same build failure (orphaned `using SDKTemplate;` is in Settings.xaml.cs) | Same |

**Visual discrepancies:** none capturable (no WinUI screenshot; UWP golden stayed on the
extended splash screen so no baseline controls either).

**Summary:** One generalizable skill gap (the ubiquitous `SDKTemplate` namespace) sank the
whole migration.
