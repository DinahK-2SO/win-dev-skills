# Skill defects — CameraFaceDetection (index 0)  → WILL change skill

## 1. Hardcoded literal `Foreground="White"` becomes invisible on WinUI 3's default Light theme
- **Evidence:** generated MainPage.xaml `<TextBlock x:Name="StatusText" Foreground="White">` and button
  `<Setter Property="Foreground" Value="White"/>` over `Grid Background="{ThemeResource ApplicationPageBackgroundThemeBrush}"`; scorer downgraded to **partial** (`blank-fallback-text`, `invisible-disabled-buttons`).
- **Skill search:** only colour guidance is `StaticResource → ThemeResource` (MIGRATION-PATTERNS.md ~601);
  **nothing** about hardcoded literal colours or the UWP(dark)→WinUI(Light) default-theme shift → **absent**.
- **Root cause:** UWP camera/media overlays hardcode white to sit over a preview; WinUI 3 defaults to the
  system Light theme, so white content goes invisible on the white page when the surface is blank/absent.
- **Proposed fix:** add a "Hardcoded literal colours assume the wrong default theme" note under the
  ThemeResource pattern: replace literal white text/glyph colours with theme brushes
  (`{ThemeResource TextFillColorPrimaryBrush}`) or keep the contrasting dark container behind them.
- **Generalizes:** all camera/media/video samples use white-on-dark chrome; all migrations inherit the
  Light default theme → recurring invisibility trap.
