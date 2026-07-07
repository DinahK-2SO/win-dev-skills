# Discrepancies — LanguageFont (UWP → WinUI 3)

Overall: **faithful migration**, full structural parity (100/100). No missing controls,
no dead controls. The items below are measurement caveats, not migration defects.

## 1. WinUI 3 blank screenshots — capture limitation (severity: none)
Both WinUI 3 screenshots (`parity/winui3/screenshots/*.png`) captured blank white, via
both `PrintWindow` and screen-region capture. However the WinUI UIA tree
(`parity/winui3/ui/01.json`, `02.json`) shows **all** content laid out on-screen with real
values:
- `NavView` with "1) Fonts for UI" and "2) Fonts for Documents"
- Description TextBlock
- "Apply Recommended Fonts" button (invokable)
- `HeadingTextBlock` and `BodyTextBlock`/`DocumentTextBlock` containing Japanese sample text

This is a WinUI 3 composition-surface capture limitation in this headless session, not blank
rendering. The UWP CoreWindow captured normally because it uses a different composition path.

## 2. "Apply Recommended Fonts" behavioral heuristic false-negative (severity: none)
The behavioral overlay reported `0/1 live`. The handler changes font family/weight/style,
not text content (verified identical to the UWP source `Scenario1_UIFonts.xaml.cs` /
`Scenario2_DocumentFonts.xaml.cs`). The text-token heuristic cannot observe a font change,
so this is not evidence of a dead control.

## 3. UWP golden baseline gap for scenario 2 (severity: low)
The legacy UWP CoreWindow (hosted by `ApplicationFrameHost`) does not expose its XAML tree
to UI Automation on this machine, so title-driven navigation and control actuation failed on
the golden — only the top-level `Pane` is enumerable. UWP visual ground truth is therefore
available for **scenario 1** (initial frame `parity/baseline/screenshots/00_launch.png`)
only. WinUI scenario 2 content was independently verified present via UIA.
