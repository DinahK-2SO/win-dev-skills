# Skill Defects — BasicInput (iteration 2)

**Category:** skill-defect → WILL change skill

## Items

### 1. PointerPoint.PointerDevice property removed in WinUI 3

- **Evidence:** CS1061 in 2-PointerPointProperties.xaml.cs (lines 128, 211) — `PointerPoint` does not contain `PointerDevice`.
- **Skill search:** Grepped all skill files for `PointerDevice`, `PointerDeviceType` — zero matches.
- **Skill state:** Absent.
- **Root cause:** WinUI 3 flattened the API — `PointerDeviceType` is now directly on `PointerPoint`, removing the intermediate `PointerDevice` object.
- **Proposed fix:** Add to MIGRATION-PATTERNS.md: `PointerPoint.PointerDevice.PointerDeviceType` → `PointerPoint.PointerDeviceType`. Add to `unsupported-api-inventory.json` as adaptable with anchor `input-apis`.
- **Generalizes:** Any UWP app differentiating mouse/pen/touch input via `PointerPoint.PointerDevice` will hit this. Common in input samples, drawing apps, gesture handlers.
