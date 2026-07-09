# RadioManager — Lessons

**Score:** 75/100 (3/4 features pass; 1 fail). Build clean; app runs.

## What worked
- **Verbatim in-place XAML transform.** The shell (`RelativePanel`, `ScenarioControl`
  ListBox), the `StatusPanel`, and the `Description:` text were all preserved word-for-word
  (session-log.txt 896–934). Fidelity rules held; only nullable warnings in the build.

## Tool limitation (drives the improvement)
- **The launch/validate gates don't check persistent shell chrome.**
  `Test-AppLaunch.ps1` and `Validate-UwpMigration.ps1` only prove the process is alive and
  each scenario Frame can navigate. The SDK-sample **Status/NotifyUser area** was silently
  absent from the WinUI render while every gate passed green.

## Key struggle (undetected in-trial)
- **Status area does not render in WinUI 3.** `StatusLabel` ("Status:") + `StatusBorder`/
  `StatusBlock` are defined in `MainPage.xaml` but absent from the WinUI UIA tree; they
  render in the UWP golden. The sibling **Pane** `RelativePanel` footer (also
  `AlignBottomWithPanel`) rendered fine.
- **Root cause:** the content region positions the bottom status bar with a `RelativePanel`
  fill-graph — `Frame` = `AlignTopWithPanel` + `Above=StatusPanel`, `StatusPanel` =
  `AlignBottomWithPanel`. This graph does not reliably place `StatusPanel` in WinUI 3.
- **Preventable by:** a documented layout pattern (RelativePanel fill-graph → `Grid` with an
  `Auto` bottom row) + render-verification that covers persistent shell chrome.

## Not defects
- **Radio list empty in both apps** — radio access is hardware/permission-gated and denied
  on this machine; the empty state matches the UWP ground truth.
- **Theme/logo** — cosmetic (light vs dark, footer logo absent from tree).
