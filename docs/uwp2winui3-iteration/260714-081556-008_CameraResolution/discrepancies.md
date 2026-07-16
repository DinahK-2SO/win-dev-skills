# Discrepancies — CameraResolution (score 83, builds ✅ runs ✅)

| # | Requirement | Status | Note |
|---|-------------|--------|------|
| 1 | Change camera preview settings | pass | Controls faithful; Initialize Camera responds. |
| 2 | Change preview and photo settings | pass | All controls faithful; Initialize Camera responds. |
| 3 | Match aspect ratios | **partial** | "Video Settings" ComboBox renders but is **absent from the UIA tree** → 2/3. |

## Visual
- Scenario 3 Video Settings ComboBox: renders faithfully but not discoverable via UI Automation (`03_Match_aspect_ratios__a01_Initialize_Camera.png`). UWP baseline is splash-only (camera-gated), so no side-by-side.

## Suspected skill gap
Migration skill sets `AutomationProperties` only on the camera-preview `<Image>` (`PATTERNS.md#capture`); no general rule to set `AutomationProperties.AutomationId` on interactive controls. `x:Name` ≠ `AutomationId` in the UIA tree → matcher misses the combo. General across scenarios.
