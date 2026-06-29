# Discrepancies — CameraOpenCV (UWP → WinUI 3)

**Verdict: FAIL** (1/1 feature, blank/empty render). Score 0.

| Control | Severity | UWP | WinUI 3 |
|---|---|---|---|
| Scenario page render | critical | Full UI paints | Empty content frame (blank window) |
| `OperationComboBox` | critical | Operation selector | Missing (never navigated) |
| `CurrentOperationTextBlock` | major | "Current: Blur" | Missing |
| `PreviewImage` | major | Preview image | Missing |
| `OutputImage` | major | Output image | Missing |
| `FPSMonitor` | minor | FPS text | Missing |

## Suspected skill gap
`MainPage.OnNavigatedTo` used `if (ActualWidth < 640)` (migrated from
`Window.Current.Bounds.Width`). `Page.ActualWidth` is **0** in `OnNavigatedTo`, so the
`<640` branch ran, `SelectedIndex` stayed `-1`, and `ScenarioFrame.Navigate` was never
called. The windowing anchor in `MIGRATION-PATTERNS.md` covers `Window.Current` generally
but never warns that **window-size reads** (`Bounds.Width/Height`) cannot be replaced by
`Page.ActualWidth/ActualHeight`.

This shell (`MainPage` + `SplitView` + `ScenarioFrame` + `SampleConfiguration`) is shared
by the whole Windows-universal-samples family, so the same substitution breaks the
initial render across many scenarios.
