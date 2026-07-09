# Lessons — SimpleImaging (UWP → WinUI 3)

**Outcome:** Build succeeded (0 errors, 70 warnings) but the packaged app **fail-fasts at startup** (`0xc0000409` in `ucrtbase.dll`, no window). Every feature scores `fail`; score **0/…**. The dev-agent never found the cause and spent its whole remaining budget on the wrong things.

## What worked
- `Test-AppLaunch.ps1` correctly caught "builds but dies at startup" (the analyzer/build log cannot).
- Event-log capture surfaced the native fault code `0xc0000409`.

## What misled the agent (high-value)
- **Red-herring managed exception.** `Get-CrashSignature` reported `.NET: COMException / REGDB_E_CLASSNOTREG` as the crash cause. That 1026 event actually came from the agent's own **direct/unpackaged** run of the bare `.exe` (the `WindowsAppRuntime…DeploymentManager…AutoInitialize` frame only fails when there is no package identity). The packaged crash produced **no** 1026. The helper matched any 1026 by exe-name in a 3-minute window and grabbed the stale unpackaged artifact.
- **No `0xc0000409` guidance.** The `startup-crashes` table (and the `Get-CrashSignature` switch) has rows for `0x80004003`, `0x8001010E`, `0xE0434352`, `0xC000027B` — but **not** `0xc0000409`. Its default hint ("read event 1026") is a dead end because a native fail-fast writes no 1026.

Result: the agent downgraded `Microsoft.WindowsAppSDK` 2.2.0 → 1.7.x (broke deployment), dug through the AutoInitializer source, and stripped MicaBackdrop / `Window.Current` / `Styles.xaml` — none of which was the cause.

## The actual root cause (undocumented)
The startup navigation reaches **Scenario1** (`MainPage.OnNavigatedTo` → `SelectedIndex = 0` → `ScenarioFrame.Navigate`). Both scenario pages carry the verbatim SDK-sample placeholder **`<Image … Source="" />`**. UWP tolerated an empty-string `Source` (→ no image); **WinUI 3 runs the ImageSource converter at XAML load and an empty string is an invalid URI → fail-fast** before the window renders. (The first observed crash was even in `Microsoft.UI.Xaml.dll` / `0xc000027b`, confirming a XAML-layer failure.) Fix: remove the empty `Source=""` (leave it unset).

## Preventable by (generalizable)
1. `Get-CrashSignature`: drop the unpackaged `AutoInitialize` / `REGDB_E_CLASSNOTREG` 1026 artifact; add a `0xc0000409` case naming the no-1026 XAML-load class and the red herring.
2. `MIGRATION-PATTERNS.md#startup-crashes`: add the `0xc0000409` row + the REGDB red-herring callout.
3. Flag empty-string `<Image Source="" />` (validator WARN) + document the empty-string typed-placeholder pitfall.
