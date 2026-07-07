# Parity discrepancies — MobileBroadband

**Score 0/7 · builds ✔ · runs ✔**

All 7 scenarios `fail` for one reason: the migrated WinUI 3 window renders **blank white**.
Structural parity is 100% (every control is in the UIA tree; AccountWatcher Start/Stop and
SIM Card "Get SIM Card Information" respond behaviorally), but nothing paints.

## Visual discrepancy
- **Whole window, all scenarios** — UWP: full dark UI with 7-item nav list + labelled
  device/account fields. WinUI: pure blank white apart from window chrome.
  `parity/winui3/screenshots/00_launch.png` vs `parity/baseline/screenshots/00_launch.png`.

## Suspected skill gap
Blank-window guidance (`SKILL.md` + `MIGRATION-PATTERNS.md#system-backdrop-blank`) only
addresses `<Window.SystemBackdrop>`. The agent removed it, but the current scaffold's
`ExtendsContentIntoTitleBar = true` + `<TitleBar>` control keep the window in the same
DWM-composition-dependent transparent mode, so it still blanks in the headless capture VM.
