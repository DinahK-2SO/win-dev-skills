# Skill coverage gaps (present but unclear → WILL change skill)

1. **CS0029 PointerPoint conversion.** Covered only by the generic `Windows.UI.Input →
   Microsoft.UI.Input` table row (line 91). The agent kept mixed-namespace PointerPoint
   types and looped on CS0029 (x5). Sharpen with a concrete build-error entry: use
   `using Microsoft.UI.Input;` and re-type the locals.

2. **CS0234 `Colors`.** Covered by table row (line 92) but the agent hit CS0234 x8.
   Clarify that the `Colors` palette moves to `Microsoft.UI.Colors` while the
   `Windows.UI.Color` struct stays.

Both are folded into the same new pointer/gesture/Colors build-error subsection.
