# Lessons — CameraAdvancedCapture (index 46)

Outcome: **score 100/100, builds, runs** (faithful single-page migration). All value here
is in the dev-agent's *build-time struggles* even though the final result passed.

## Errors encountered (root cause → fix)
- **CS1061 `Application` has no `Suspending` / `Resuming`** (9× each). WinUI 3
  `Microsoft.UI.Xaml.Application` drops the UWP app-suspend/resume events. The UWP
  `MainPage.xaml.cs` (lines 102-103) hooked `Application.Current.Suspending/Resuming` to
  init/clean up the camera; carried verbatim → build error. Fix: delete the subscriptions
  and their handlers; desktop apps aren't suspended.
- **CS0176 `NavigationCacheMode.Disabled` cannot be accessed with an instance reference**
  (11×). UWP `MainPage.xaml.cs` line 99: `NavigationCacheMode = NavigationCacheMode.Disabled;`
  (a standard UWP page-template line). Inside a Page the unqualified enum name is shadowed
  by the `Page.NavigationCacheMode` instance property. Fix: qualify —
  `Microsoft.UI.Xaml.Navigation.NavigationCacheMode.Disabled`.
- **CS0102 duplicate `AdvancedCaptureContext`** (18×). One-off agent editing slip — the
  helper class got defined twice in `MainPage.xaml.cs`. Not a migration-pattern gap.

## Dev-agent struggles → preventable_by
- Suspending/Resuming: ~9 build cycles lost. Preventable by a build-error entry + lifecycle
  note + an inventory pattern that injects an inline TODO on the subscription lines.
- NavigationCacheMode: several build cycles. Preventable by a documented qualify-the-enum
  build-error entry.
- CS0102 duplicate: editing slip; no skill change warranted.

## Special APIs
- `CaptureElement` / `Windows.Media.Capture`: no WinUI 3 XAML equivalent; agent used an
  `Image` preview + no-camera `FallbackPanel` (already covered by the skill's unsupported
  inventory).
