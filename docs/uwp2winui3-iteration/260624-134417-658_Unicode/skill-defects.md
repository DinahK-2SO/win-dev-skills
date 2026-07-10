# Skill-defects (WILL change skill) — Unicode

## 1. Validator over-promises that the window renders  → change Validate-UwpMigration.ps1
- **Evidence:** `Validate-UwpMigration.ps1` L740/L758 print
  `[PASS] ... window will not blank in headless/VM capture` and
  `[PASS] ... page background will resolve in WinUI 3` (seen at session-log.txt L2994-2995).
  The candidate had **no** backdrop/TitleBar/ExtendsContentIntoTitleBar and **no**
  `ApplicationPageBackgroundThemeBrush` (both root Grids paint `SolidBackgroundFillColorBaseBrush`)
  yet still rendered a uniform ~9KB white client area (`parity/winui3/screenshots/01_*.png`),
  with the UIA tree fully populated at real coords (`parity/winui3/ui/01.json`).
- **Skill state:** *wrong* — the PASS text asserts an unconditional rendering guarantee a
  static scan cannot make.
- **Fix:** scope both PASS lines to "known triggers absent" and, in the same line, state the
  render is unverified until a per-scenario screenshot confirms non-blank.
- **Generalizes:** the validator is every migration's final gate; blank causes are open-ended,
  so a "won't blank" promise will keep passing blank apps across scenarios.
