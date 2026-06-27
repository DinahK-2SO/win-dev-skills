# Lessons — BasicInput (UWP → WinUI 3)

**Outcome:** Build SUCCEEDED, score 100 (5/5 pass). No functional/parity discrepancies.
All evidence is from the *development* log: a recurring cluster of build errors in the
pointer/gesture/colors code paths that the agent had to fix by hand.

## Recurring build errors (root cause → fix)

| Error (count) | Root cause | Fix |
|---|---|---|
| `CS0234 'Colors' not in 'Windows.UI'` (8) | `Colors` palette moved to `Microsoft.UI.Colors` (the `Windows.UI.Color` struct stays) | `Microsoft.UI.Colors.<Name>` |
| `CS0029 Microsoft.UI.Input.PointerPoint → Windows.UI.Input.PointerPoint` (5) | `GetCurrentPoint()/GetIntermediatePoints()` return `Microsoft.UI.Input.PointerPoint` | `using Microsoft.UI.Input;`, type locals from there |
| `CS1061 PointerPoint has no 'PointerDevice'` (4) | `PointerPoint.PointerDevice` removed in WinUI 3 | Use `PointerPoint.PointerDeviceType`; enum is in `Microsoft.UI.Input` |
| `CS0019 '==' on HoldingState/HoldingState` (2) | Two same-named enums in scope | Drop `Windows.UI.Input` using / qualify `Microsoft.UI.Input.HoldingState` |
| `CS8618/8600/8602/8604/8625` (many) | Scaffold enables `<Nullable>`; ported code not annotated | Non-fatal warnings; build still succeeded — low leverage |

## Why it generalizes
Pointer/touch/gesture handling is one of the most common UWP feature areas. The bulk
`Initialize-UwpMigration.ps1` rewrite only converts `Windows.UI.Xaml.*`; the
`Windows.UI.Input` / `Windows.Devices.Input` / `Windows.UI.Colors` namespaces — and the
`PointerPoint.PointerDevice` shape change — are left for hand-editing. Any sample with
pointer input (PointerPoint, GestureRecognizer, manipulations, holding) hits this exact
cluster.

## Tools
- `Initialize-UwpMigration.ps1`: helpful (got to a building scaffold) but limited — only
  rewrites `Windows.UI.Xaml`, so the input/colors namespaces stay broken.
