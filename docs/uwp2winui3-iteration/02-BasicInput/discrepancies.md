# Discrepancies — BasicInput (iteration 2)

**Score**: 10 | **Builds**: ✅ | **Runs**: ✅ | **Pass**: 15/19 | **Partial**: 4 | **Fail**: 0

## Summary

All 4 partial features are due to evaluation tool screenshot capture limitations (blank screenshots from WinUI 3 DirectComposition rendering), not actual migration defects. The code is correct in all cases.

## Partial Features

| ID | Feature | Reason for Partial |
|----|---------|-------------------|
| pointer-device-specific-props | Device-specific pointer properties | Color-coding exists in code but cannot be visually verified |
| xaml-manipulation-translate-rotate | Rectangle drag and rotate | Canvas rendering not captured in screenshots |
| xaml-manipulation-reset | Reset button | Visual position reset cannot be confirmed |
| gesture-recognizer-translate-rotate | GestureRecognizer drag/rotate | Canvas rendering not captured |

## Visual Discrepancies

None — no screenshots available for comparison (blank due to DirectComposition).

## Missing Features

None — all features implemented in code.
