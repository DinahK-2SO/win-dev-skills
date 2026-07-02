# Skill defects — will change skill

## 1. UWP Suspending/Resuming lifecycle events absent from skill
- **Problem:** `Application.Current.Suspending/Resuming`, `SuspendingEventHandler`,
  `SuspendingEventArgs` copied from the UWP sample don't exist on WinUI 3
  `Microsoft.UI.Xaml.Application` → build fails.
- **Evidence:** migration-score.json build_error; call sites in `EventHandlerForDevice.cs`,
  `Scenario1_ConnectDisconnect.xaml.cs`, `Scenario4_BulkPipes.xaml.cs`.
- **Skill state:** ABSENT. `#lifecycle` covers only OnLaunched/OnActivated; inventory has
  no Suspending pattern.
- **Fix:** add an `adaptable` inventory entry (anchor `#lifecycle`) so a TODO is injected
  at each site, + extend `#lifecycle` prose: WinUI 3 has no suspend/resume; move cleanup
  to `Window.Closed` / `AppWindow.Closing`.
- **Generalizes:** the EventHandlerForDevice suspend/resume idiom ships in the whole UWP
  device-access sample family; suspend-based cleanup is a ubiquitous UWP pattern.
