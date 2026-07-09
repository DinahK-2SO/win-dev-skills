# Skill Defects → WILL change skill

## 1. No pattern for the SDK-sample persistent Status/NotifyUser area layout
- **Problem:** The shell content region places a bottom Status bar with a `RelativePanel`
  fill-graph (`Frame AlignTopWithPanel + Above=StatusPanel`; `StatusPanel
  AlignBottomWithPanel`). Migrated verbatim, WinUI 3 does not reliably lay it out, so the
  whole Status area (`StatusLabel` "Status:" + `StatusBorder`/`StatusBlock`) is absent from
  the render/UIA tree — while the app builds clean and stays alive.
- **Evidence:** migration-score.json `Status notification area` = **fail**;
  `parity/baseline/ui/01.json` has StatusLabel "Status:" (line 298), `parity/winui3/ui/01.json`
  has none; `MainPage.xaml` lines 43–55.
- **Skill state:** **absent** — PATTERNS.md covers element-level swaps and blank-page/window
  causes, but not this layout.
- **Fix:** Add a MIGRATION-PATTERNS.md subsection: the content-region RelativePanel
  fill-graph can drop the bottom StatusPanel in WinUI 3; robust equivalent is a `Grid` with a
  `*` Frame row + `Auto` StatusPanel row (container swap only, all controls/text preserved).
  Cross-link from Silent-navigation-failures.
- **Generalizes:** The entire Windows-universal-samples family ships this identical shell +
  Status area; the status bar is scored, so every such sample loses it without this pattern.
