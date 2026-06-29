# Skill defects — CameraOpenCV (WILL change skill)

## 1. Window-size reads (`Window.Current.Bounds`) wrongly become `Page.ActualWidth`
- **Problem:** `MainPage.OnNavigatedTo` used `if (ActualWidth < 640)` (migrated from
  `Window.Current.Bounds.Width`). `Page.ActualWidth` is **0** before the first layout
  pass, so `SelectedIndex` stayed `-1` and `ScenarioFrame.Navigate` never ran → empty
  blank window.
- **Evidence:** migrated `MainPage.xaml.cs`; agent log row "Window.Current → ActualWidth";
  `parity/winui3/ui/01.json` (nav shell present, no `ScenarioFrame` content);
  `migration-score.json` feature `fail`.
- **Skill state:** **absent.** Windowing anchor (MIGRATION-PATTERNS.md:150) covers
  `Window.Current` lifecycle/handle but never the `.Bounds` **size** usage nor the
  `ActualWidth == 0 before layout` trap.
- **Fix:** add a "Window size reads" subsection to the windowing anchor — rule + correct
  `AppWindow.Size` / defer-to-`Loaded`/`SizeChanged` replacement + the fixed
  `OnNavigatedTo` example.
- **Generalizes:** the SDK-sample shell (`MainPage`/`SplitView`/`ScenarioFrame`) and its
  `>=640` auto-select check are shared by the whole Windows-universal-samples family this
  benchmark migrates; UWP adaptive code broadly reads `Window.Current.Bounds`.
