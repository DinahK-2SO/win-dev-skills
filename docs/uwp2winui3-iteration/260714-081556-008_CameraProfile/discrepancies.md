# Discrepancies — CameraProfile (index 0)

Score **100/100**, builds ✅, runs ✅. All 3 requirements **pass**.

| # | Requirement | Status | Note |
|---|-------------|--------|------|
| 0 | Locate Record Specific Profile | pass | 2/2 buttons live, ERROR status correct |
| 1 | Query Profile for Concurrency | pass | 1/1 live, expected ERROR shown |
| 2 | Query Profile for HDR Support | pass | live, but auto-invoke ambiguous (no AutomationId; Content ⊂ nav item text) |

## Visual
- Light vs dark theme = host system theme only (cosmetic, not a defect).

## Suspected skill gap (only one, and it is general)
Interactive buttons were migrated verbatim from UWP with **no `x:Name` / `AutomationProperties.AutomationId`**. The skill teaches "copy verbatim, preserve names" but never says to **add** a stable AutomationId to interactive controls that lack one. Result: the HDR button was unaddressable by the UIA-based capture (its `Content` is a substring of the nav item `3) Query Profile for HDR Support`), so `actionsInvoked = 0/1`. It only scored pass because scoring fell back to a manual invoke; a stricter run would risk partial. Recurs on any sample whose buttons are Content-only.
