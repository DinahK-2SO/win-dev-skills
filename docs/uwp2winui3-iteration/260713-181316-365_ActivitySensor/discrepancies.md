# Discrepancies — ActivitySensor (WinUI 3 vs UWP)

- **Build:** FAILED. **Runs:** no. **Score:** 0/4.
- Single build-blocking cause propagates to every feature:
  `CS0118: 'ActivitySensor' is a namespace but is used like a type`
  (`Scenario3_ChangeEvents.xaml.cs:33`) + cascading `WMC9999`.

| # | Feature | Status | Reason |
|---|---------|--------|--------|
| 0 | Current activity | fail | App does not build → no capture |
| 1 | Activity history | fail | App does not build → no capture |
| 2 | Events | fail | CS0118 lives in this page's code-behind |
| 3 | Background activity | fail | App does not build → no capture |

No visual discrepancies could be captured (no WinUI build; UWP golden hung on splash).
The migration fails independently of the unusable UWP baseline — it does not compile.
