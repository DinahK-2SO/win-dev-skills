# Skill defects — MobileBroadband (WILL change skill)

## 1. Blank-window guidance only covers half the composition-dependent triggers
- **Problem:** App scores 0 — window renders blank white for all 7 scenarios even though
  the agent removed `<Window.SystemBackdrop>` per the skill. The current scaffold's
  `ExtendsContentIntoTitleBar = true` + `<TitleBar>` control is a second, uncovered
  composition-dependent transparent-window trigger that still blanks in headless capture.
- **Evidence:** blank `parity/winui3/00_launch.png` vs full-dark baseline;
  `migration-score.json` `features_fail=7`; validator `[PASS]` at session-log 3135/3200
  while the app is still blank; final `MainWindow.xaml`/`.xaml.cs` retain `<TitleBar>` +
  `ExtendsContentIntoTitleBar = true`.
- **Skill state:** *wrong / incomplete.* SKILL.md and `MIGRATION-PATTERNS.md#system-backdrop-blank`
  say deleting `<Window.SystemBackdrop>` "restores reliable rendering" — false when
  extend-into-title-bar remains.
- **Fix:** broaden the guidance to neutralize BOTH triggers (remove backdrop **and** revert
  the scaffold custom title bar to the standard opaque one); extend
  `Validate-UwpMigration.ps1` Section 9 to WARN on `ExtendsContentIntoTitleBar=true` /
  `<TitleBar>`.
- **Generalizes:** every current-template WinUI 3 migration inherits this chrome; every
  headless/VM/CI parity capture will blank unless both triggers are removed.
