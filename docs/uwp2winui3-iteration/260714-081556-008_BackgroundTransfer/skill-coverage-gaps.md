# Skill coverage gaps — BackgroundTransfer

## 1. First navigation / initial NavigationView selection in a constructor → startup race (0xC000027B)
- **Problem:** app crashes before first frame; all 7 scenarios unobservable. `MainWindow`
  ctor navigates the root Frame and `MainPage` ctor sets `NavigationView.SelectedItem`
  (which navigates the scenario Frame) — both before `Window.Activate()`.
- **Evidence:** `migration-score.json` (crashed 0xC000027B before first frame),
  `discrepancies.json` (all scenario-missing), `MainWindow.xaml.cs` / `MainPage.xaml.cs`.
- **Covered at:** MIGRATION-PATTERNS.md "Initialization order — keep MainWindow's
  constructor inert" + the 0xC000027B startup-crash row.
- **Why missed:** the deferral guidance is scoped to the static-window ref → E_POINTER
  case; these pages never read `App.MainWindow`, so the agent thought ctor nav was safe.
  The general rule and the NavigationView-selection idiom aren't stated, and nothing
  enforces it. The smoke launch passed (the race didn't reproduce), so it slipped through.
- **Fix:** (Tier 1) validator static check that FAILS on first-navigation / initial
  selection inside a Window/Page ctor; (Tier 3) broaden the init-order section to the
  general rule + the "select first item in constructor" idiom, cross-ref the 0xC000027B row.
- **Generalizes:** SDK samples universally select the first item / navigate in the ctor;
  in WinUI 3 this is a recurring, intermittent startup crash across multi-scenario migrations.
