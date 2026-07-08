# Skill Defects — Printing (WILL change skill)

## 1. `ApplicationPageBackgroundThemeBrush` is UWP-only → blank WinUI 3 window
- **Evidence:** score 0/6, all scenarios blank; `MainWindow.xaml` clean (no backdrop) yet blank; `MainPage.xaml` root `Grid Background="{ThemeResource ApplicationPageBackgroundThemeBrush}"`.
- **Skill state:** WRONG. MIGRATION-PATTERNS.md (~line 152) recommends `{ThemeResource ApplicationPageBackgroundThemeBrush}` as the opaque fallback, and the blank-window sections claim a de-composed window "uses its normal opaque background."
- **Root cause:** That brush is not defined in WinUI 3 → null → transparent root; a WinUI 3 `Window` has no default page background → blank white in capture.
- **Fix:** Correct the wrong claims; add the brush to the UWP→WinUI 3 remap (→ `SolidBackgroundFillColorBaseBrush`); add a validator WARN that flags the brush.
- **Generalizes:** The default UWP page template ships this brush on the root Grid, so almost every migration inherits it → recurring blank-window failure.
