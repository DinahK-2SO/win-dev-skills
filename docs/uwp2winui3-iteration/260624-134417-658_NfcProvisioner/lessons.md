# Lessons — NfcProvisioner (iteration 0)

**Outcome:** score 50 / partial. Build clean, app runs, Browse works, migrated Scenario1.xaml byte-identical to source. Only blocker to a `pass` was a blank/white screenshot, which the scoring attributes to a WinUI 3 DirectComposition surface that GDI-based capture cannot grab (UIA shows every control on-screen) — an **evaluation-instrument limitation**, not a migration defect.

## Highest-value lesson: `0x802B000A` startup crash from missing resource keys
- The migrated app **built clean but crashed at launch** with native code `0x802B000A` (`E_XAMLPARSEFAILED`).
- **Root cause:** `MainPage.xaml` and `Scenario1.xaml` reference shared sample styles (`SampleHeaderTextStyle`, `ScenarioDescriptionTextStyle`, …) that the UWP sample defined in `Common/StandardStyles.xaml` / the sample-template `App.xaml`. Those dictionaries were never migrated into the WinUI 3 scaffold, so `{StaticResource …}` compiled but threw when the page's XAML was parsed at launch.
- **Fix the agent found (~10 turns of manual bisection):** define the referenced styles in `App.xaml` `Application.Resources` and drop dangling template chrome.
- **Why it took so long:** the startup-crash native-code table listed 0x80004003 / 0x8001010E / 0xE0434352 / 0xC000027B but **not** 0x802B000A — the exact code the crash tooling surfaced. Nothing pointed at "missing resource key."

## Tooling that worked
- `Validate-UwpMigration.ps1` / `Test-AppLaunch.ps1` correctly detected the launch crash and routed to `Get-MigrationPattern.ps1 -Anchor startup-crashes`.
- `Get-WinEvent` (events 1000/1026) surfaced the P8=802b000a code.

## Other errors (self-inflicted, recovered)
- CS8803/CS0106 in `Scenario1.xaml.cs` — a SEQUENTIAL edit misplaced a closing brace, dropping methods outside the class. Recovered on the next edit.
- WMC0909 `Cannot resolve DataType local:Scenario` in MainPage.xaml — cleared once the project compiled and MainPage rebuilt.

## Special API
- `Windows.Networking.Proximity.ProximityDevice` works under WinUI 3 desktop with no adaptation; it only forced SEQUENTIAL edit mode (output-safety filter on the API-name family).
