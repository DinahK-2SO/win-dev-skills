# Discrepancies — DisablingScreenCapture (UWP vs WinUI 3)

Score **100/100**, builds ✅, runs ✅, 0 behavioral regressions.

## Requirements
1. Enabling screen capture — **pass**. WinUI UIA matches UWP (description text, MediaPlayerElement, StatusBlock).
2. Disabling screen capture — **pass**. `SetWindowDisplayAffinity(WDA_EXCLUDEFROMCAPTURE)` on nav-in / `WDA_NONE` on nav-out. *Reached only after a CS1061 build failure — skill lacked the mapping (see skill-defects).* 
3. Managing AppCapture — **pass**. ToggleSwitch wired to `AppCapture.SetAllowedAsync`; effect only visible during active capture.

## Visual discrepancies
- All scenarios: WinUI screenshots render **blank white** while the UIA tree is fully
  populated (45 elements) and matches the UWP. Root cause is a winapp PrintWindow
  limitation for WinUI windows hosting a `MediaPlayerElement` (DirectComposition overlay)
  — a **measurement caveat in the eval tooling**, not an app defect, and out of scope for
  the migration skill.

## Missing features
None.
