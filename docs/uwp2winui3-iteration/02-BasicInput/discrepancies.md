# Discrepancies — BasicInput (iteration 2)

**Score:** 94 | **Builds:** ✅ | **Runs:** ✅

## Requirements (all pass)

All 7 requirements pass. No suspected skill gaps.

## Visual Discrepancies

| Feature | UWP | WinUI 3 | Screenshot |
|---------|-----|---------|------------|
| pointer-properties-canvas | Canvas shows pointer popup on click | Canvas empty in static screenshot — popup only during interaction. Code correct. | winui3-pointer-properties-canvas.png |
| xaml-manipulations-inertia-toggle | ToggleSwitch with standard UIA pattern | ToggleSwitch renders correctly but UIA exposes as Button — WinUI 3 platform difference | winui3-xaml-manipulations-inertia-toggle.png |
| gesture-recognizer-inertia-toggle | Same as above | Same UIA issue. Visually correct. | winui3-gesture-recognizer-inertia-toggle.png |

## Summary

High-quality migration. All partial verdicts stem from either static screenshot evaluation limitations (pointer canvas) or WinUI 3 platform UIA differences (ToggleSwitch), not from migration code defects.
