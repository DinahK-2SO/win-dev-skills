# Lessons — BasicInput (iteration 2)

## Tools Helpful
- **winui-uwp-migration skill**: Loaded on turn 0; scaffold + namespace rewrite workflow succeeded across 5 scenarios
- **dotnet new winui template**: Clean scaffold on first attempt

## Failed APIs
- **PointerPoint.PointerDevice**: UWP provides `PointerDevice` sub-property; WinUI 3 flattened it to `PointerPoint.PointerDeviceType` directly

## Special APIs
- `Microsoft.UI.Input.PointerPoint` — `PointerDeviceType` is a direct property (no `.PointerDevice` intermediary)
- `Microsoft.UI.Input.GestureRecognizer` — accepts `Microsoft.UI.Input.PointerPoint` (not `Windows.UI.Input`)

## Errors Encountered
1. **CS0234** (`Windows.UI.Colors`): Agent initially left `Windows.UI` references → fixed by switching to `Microsoft.UI`
2. **CS0029** (PointerPoint type mismatch): Mixed `Windows.UI.Input` and `Microsoft.UI.Input` types → unified to `Microsoft.UI.Input`
3. **CS1061** (`PointerDevice` not found): WinUI 3 removed the sub-property → use `.PointerDeviceType` directly

## Dev-Agent Struggles
1. **First build failure** (1 retry): Agent forgot namespace mapping for Colors/PointerPoint despite skill coverage — dev-agent-slip
2. **Second build failure** (1 retry): `PointerPoint.PointerDevice` removal not documented in skill — skill-defect, resolved by inspecting API

## Summary
Overall smooth migration (87.5% score, 15/19 pass, 4 partial). The 4 partials are all due to evaluation screenshot capture limitations (blank screenshots from DirectComposition), not actual code issues. Build succeeded after 2 fix cycles. Total session time: 19 minutes.
