# Lessons — Inclinometer UWP→WinUI 3 migration

Final: **build succeeded, scored 100/100** (3/3 features pass). No functional discrepancies. The value here is *friction*, not failure.

## Tools that helped
- **Initialize-UwpMigration.ps1** — scaffold + bulk `Windows.UI.Xaml → Microsoft.UI.Xaml` rewrite (turn ~2). `DispatcherTimer`, `NotifyUser` helper compiled unchanged.
- **Validate-UwpMigration.ps1** — Section 7 smoke launch caught a clean-build/crash-at-startup (`0xC000027B`); also gated on MIGRATION-MAPPING rows left at `copied`.
- **Test-AppLaunch.ps1** — captured the native exception code + faulting module from WER (only signal of the crash).
- **Get-MigrationPattern.ps1** — `startup-crashes` anchor.

## Tool limitation
- The `0xC000027B` hint (Test-AppLaunch.ps1 + PATTERNS.md#startup-crashes) only says "legacy projection/activation incompatibility → defer the API". Here `0xC000027B` was really the **static-window init-order navigation race** — the same cause as `E_POINTER`. Guidance should also point at the navigate-after-Activate fix / `#windowing`.

## Errors encountered → root cause → fix
- **CS0118** `'Inclinometer' is a namespace but is used like a type` — project root namespace == WinRT sensor type name; bare `Inclinometer` field resolves to the namespace → fully qualify `Windows.Devices.Sensors.Inclinometer` (turn ~57).
- **CS0122** `MainWindow.RootFrame inaccessible` — tried to navigate from `App.OnLaunched` via private `RootFrame` → moved navigation inside MainWindow (turns ~77-79).
- **0xC000027B startup crash** — `MainWindow` navigated to a page reading `App.MainWindow` before `OnLaunched` assigned it → deferred first `Navigate` to `Activated` (turns ~70-80).
- Asset path (`SharedContent\media\Samples\`) and MIGRATION-MAPPING `copied`→`done` — minor, 1 turn each.

## Biggest struggle
Startup navigation / init-order (~5 turns, mig 70-80): crash `0xC000027B`, then a wrong fix (navigate from `App`, hitting CS0122), before landing on the documented `Activated`-deferral. Preventable by making the `0xC000027B` guidance name the init-order race.
