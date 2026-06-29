# Lessons — CameraFrames (UWP → WinUI 3)

Score **75** (scenario 1 pass, scenario 2 partial), builds ✅, runs ✅, 0 behavioral regressions.
The migration was mechanically clean: pages copied verbatim, namespaces rewritten, build green,
both scenario pages render in the WinUI UIA tree. One real, generalizable quality gap.

## Key struggle (high-value)
- **Scenario 2 ComboBoxes report empty AutomationId/Name to UI Automation.** The three selectors
  (Source Group, Frame Source, Media Format) are present and wired with `x:Name`, but in WinUI 3
  `x:Name` is **not** projected as the UIA AutomationId. So parity name-matching found only 2/5
  controls → scenario 2 held at *partial*.
  - Root cause: the migration skill never tells the agent to add `AutomationProperties.AutomationId`.
  - Preventable by: PATTERNS.md guidance + a validator WARN on named interactive controls missing it.

## Tooling
- **Helpful:** bootstrap (`Initialize-UwpMigration`) and the validator gate (clean build + smoke launch).
- **Limitation:** validator checked build & visible-text fidelity but had no UI-Automation-identity check,
  so the empty-AutomationId controls slipped through.

## Environment (not migration defects)
- WinUI 3 PNG captures came up blank (swapchain not grabbable); eval fell back to the UIA tree.
- No camera present → Start/Stop disabled and "No source groups found" — identical to UWP.
