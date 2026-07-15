# Lessons — BackgroundTransfer (UWP → WinUI 3)

**Outcome:** score 0, builds:true, runs:false. Migrated app crashed at startup with
`0xC000027B` in `Microsoft.UI.Xaml.dll` before presenting its first frame; all 7
scenarios were unobservable.

## Root cause
- `MainWindow` constructor calls `RootFrame.Navigate(typeof(SDKTemplate.MainPage))`.
- `MainPage` constructor sets `NavigationViewControl.SelectedItem = MenuItems[0]`, which
  fires `SelectionChanged` and synchronously navigates the scenario `Frame` — all before
  `App.OnLaunched` calls `_window.Activate()`.
- Doing the first navigation / initial `NavigationView` selection **in the constructor**
  (before Activate / before the tree is loaded) is a startup **race** that intermittently
  throws a native stowed exception (`0xC000027B`) in the XAML core.

## Why it wasn't caught
- The migration's own smoke launch (`Test-AppLaunch.ps1`, Section 7 of the validator)
  reported `status=running` ("app stayed alive 10s"). Because the crash is a *race*, a
  single 10s Debug launch survived it — a **false PASS**. The scorer's launch crashed.

## Generalizable takeaways
- Defer **all** first navigation and initial `NavigationView`/`ListBox` selection to a
  `Loaded`/`Activated` handler — not just when a `Page` reads `App.MainWindow`.
- The UWP SDK-sample idiom "select the first item in the constructor" is the recurring
  trigger and must be rewritten during migration.
- Prevent this class **statically** (validator) rather than relying on a launch that may
  not reproduce the race.
