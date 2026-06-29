# Lessons — CameraOpenCV (UWP → WinUI 3)

## Outcome
Builds ✅, launches & stays alive ✅, but the user-facing scenario **never renders**
(empty `ScenarioFrame`; window appears blank). Score = 0 (1/1 feature fail).

## Root cause (high-value)
The SDK-sample `MainPage.OnNavigatedTo` decides whether to auto-select scenario 0 based
on window width:

```csharp
// UWP original
if (Window.Current.Bounds.Width < 640) ScenarioControl.SelectedIndex = -1;
else                                    ScenarioControl.SelectedIndex = 0;
```

The agent replaced `Window.Current.Bounds.Width` with `this.ActualWidth`:

```csharp
// migrated (broken)
if (ActualWidth < 640) ScenarioControl.SelectedIndex = -1;   // ActualWidth == 0 here!
else                   ScenarioControl.SelectedIndex = 0;
```

`Page.ActualWidth` is **0 inside `OnNavigatedTo`** (before the first layout pass), so the
`<640` branch always runs → `SelectedIndex = -1` → `ScenarioFrame.Navigate` is never
called → the app opens to an empty content frame.

**General rule:** a `Window.Current.Bounds`/`CoreWindow.Bounds` *size read* must NOT be
naively swapped for `Page.ActualWidth`/`ActualHeight` (0 until first layout). Use
`AppWindow.Size` (valid immediately) or move the size-dependent logic into a `Loaded` /
`SizeChanged` handler.

## Why it slipped through
- `Validate-UwpMigration.ps1` smoke-launch only checks the **process stays alive**, which
  a blank/empty window also satisfies → false PASS → agent declared success.
- Residue grep passed (0 `Window.Current` references) because the substitution was
  syntactically complete; the bug is **semantic**, not residual.

## Confirming evidence
- UIA tree (`parity/winui3/ui/01.json`): nav shell laid out with real geometry
  (`SplitViewPane`, `Scenarios` ListBox, item `1) Example Operations`) but **no
  `ScenarioFrame` content** — the scenario page was never navigated.
- `migration-score.json`: feature "Example Operations" verdict `fail`,
  `winui_responded:false`.
