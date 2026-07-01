# Skill defects (WILL change skill) — CustomSerialDeviceAccess

## 1. `Application.Suspending` / `.Resuming` removal is absent from the skill
- **Evidence:** `winui_build_errors` = 4× `CS1061` on `Application.Suspending`/`Resuming`;
  final source still has `App.Current.Suspending += ...` in `EventHandlerForDevice.cs` and
  `Scenario1_ConnectDisconnect.xaml.cs`.
- **Skill search:** grep for `Suspend|Resum|EnteredBackground|LeavingBackground` across the
  whole `winui-uwp-migration` skill → **zero matches**. `#lifecycle` only covers
  `OnLaunched`/activation; the inventory has no matching pattern (so no `TODO` injected).
- **State:** absent.
- **Root cause:** `Microsoft.UI.Xaml.Application` has no `Suspending`/`Resuming`/
  `EnteredBackground`/`LeavingBackground`; desktop apps aren't PLM-suspended.
- **Fix:** add inventory pattern → `#lifecycle` TODO injection + document the
  `Window.Closed` replacement in PATTERNS.md `#lifecycle`.
- **Generalizes:** the `EventHandlerForDevice` pattern is shared across the whole device
  sample family; these events are ubiquitous in UWP → the same CS1061 recurs everywhere.
