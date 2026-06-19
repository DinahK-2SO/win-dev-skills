# Skill Defects — BasicInput (iteration 2)

**Category**: skill-defect (skill is missing the case → WILL change skill)

## Items

### 1. PointerPoint.PointerDevice property removed in WinUI 3

- **Evidence**: Second build failure — `CS1061: 'PointerPoint' does not contain a definition for 'PointerDevice'` in `2-PointerPointProperties.xaml.cs`
- **Skill search**: Grepped `PointerDevice` and `PointerDeviceType` — no matches in skill
- **Skill state**: Absent
- **Root cause**: MIGRATION-PATTERNS.md documents `Windows.UI.Input → Microsoft.UI.Input` namespace move but not the API shape change where `PointerPoint.PointerDevice.PointerDeviceType` became `PointerPoint.PointerDeviceType` (flattened)
- **Proposed fix**: Add entry to MIGRATION-PATTERNS.md: "`pointerPoint.PointerDevice.PointerDeviceType` → `pointerPoint.PointerDeviceType`"
- **Generalizes**: All UWP apps with pointer input (drawing, gestures, touch routing) will hit this pattern
