# Parity Discrepancies — ApplicationData (index 0)

**Score 100/100 · builds ✅ · runs ✅ · 2/2 features pass · 0 behavioral regressions**

## Requirements (from migration-score.json / rubric)
- ✅ Clear scenario renders (list + ClearAsync description + Clear button)
- ✅ Clear button → "ApplicationData has been cleared. ..."
- ✅ SetVersion scenario renders (two buttons + initial "Version: N")
- ✅ Set version to 0 → "Version: 0"
- ✅ Set version to 1 → "Version: 1"

## Visual discrepancies
- **Theme (minor):** WinUI renders light (white bg/dark text); UWP baseline was dark. Layout, controls, header, list, footer otherwise equivalent. This is the WinUI 3 default-theme convention and does not affect functionality.

## Missing features
- None.

Only skill-relevant finding is the build-time `Windows.UI.Colors` friction (see lessons + skill-coverage-gaps).
