# Lessons — DisplayOrientation (UWP→WinUI 3)

**Outcome:** builds ✓, launches ✓, but the single scenario renders a **blank page** (0/5 controls). Score 0.

## Root cause (primary)
- WinUI UIA tree captured: `Navigation to DisplayOrientation.Scenario1_Orientation failed: Object reference not set to an instance of an object.`
- `Scenario1_Orientation.OnNavigatedTo` reads `App.MainWindow!.AppWindow`.
- The scaffold's `MainWindow` **constructor** calls `RootFrame.Navigate(typeof(MainPage))`. `MainPage.OnNavigatedTo` adds a nav item + sets `SelectedItem`, which cascades synchronously into `ScenarioFrame.Navigate(Scenario1)` — all **inside `new MainWindow()`**, before `App.OnLaunched` assigns `MainWindow = window`.
- So `App.MainWindow` is `null` → `App.MainWindow!.AppWindow` throws **NullReferenceException**.
- Because the throw happens inside a **nested** scenario `Frame`, `Frame.Navigate` swallows it into `NavigationFailed` (`e.Handled = true`) → **process stays alive, page stays blank**.

## Why the smoke launch missed it
- `Test-AppLaunch.ps1` / Validator §7 only prove the **process is alive**. The nested-frame swallow keeps the process alive, so the smoke launch reported **PASS** on a blank app.
- The skill's init-order section wrongly claims *"Validator catches this race with a 10s smoke launch"* — true only when the throw reaches the **root** frame and crashes; false for a throw in a nested scenario frame.

## Latent second bug
- `DisplayInformation.AutoRotationPreferences` (static get/set) is view/CoreWindow-bound and throws at runtime in WinUI 3 desktop. It is undetected by the inventory (only `GetForCurrentView()` is matched) so no TODO was injected. Even after fixing the init-order NRE, this would keep the page broken.

## What worked
- Agent correctly resolved `DisplayInformation.GetForCurrentView().OrientationChanged` via Win32 `EnumDisplaySettings` + `AppWindow.Changed` (TODO[migrate-001] → PATTERNS.md#getforcurrentview).
