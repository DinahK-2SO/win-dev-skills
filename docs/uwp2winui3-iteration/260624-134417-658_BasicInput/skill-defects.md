# Skill defects (skill absent/wrong → WILL change skill)

1. **PointerPoint shape change not documented.** `PointerPoint.PointerDevice` removed in
   WinUI 3 (CS1061 x4); `PointerDeviceType` moved `Windows.Devices.Input` →
   `Microsoft.UI.Input`. Skill only has the generic `Windows.UI.Input → Microsoft.UI.Input`
   table row. *Generalizes:* pointer/touch input is a very common UWP feature area.

2. **`HoldingState` dual-enum ambiguity not documented.** CS0019 x2 — two same-named
   `HoldingState` enums in scope; WinUI 3 args use `Microsoft.UI.Input.HoldingState`. No
   mention in the skill. *Generalizes:* standard holding/right-tap gesture boilerplate.

Both fixed by adding a prominent pointer/gesture/Colors build-error subsection plus a
`Windows.Devices.Input → Microsoft.UI.Input` namespace-table row.
