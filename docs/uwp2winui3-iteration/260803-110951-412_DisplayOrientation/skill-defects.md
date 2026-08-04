# Skill defects — DisplayOrientation (WILL change skill)

## 1. `#getforcurrentview` gives a wrong/incomplete `DisplayInformation` replacement
- **Problem:** Orientation output dead in the migrated app (partial score). Agent kept the throwing
  `DisplayInformation.GetForCurrentView()` in a try/catch because the skill offered no working alternative.
- **Wrong text:** row maps `DisplayInformation.GetForCurrentView()` → *only* `XamlRoot.RasterizationScale` /
  `GetDpiForWindow`; section preamble says "None of the GetForCurrentView() patterns work in WinUI 3 desktop".
- **Root cause:** DPI is presented as the sole replacement, so orientation looks unsupported. In reality the
  Windows App SDK ships `Microsoft.Graphics.Display.DisplayInformation.CreateForWindowId(windowId)`, which keeps
  all members (orientation, DPI, color).
- **Fix:** point the row at `CreateForWindowId(windowId)`, note DPI shortcut as a subset, soften the "None work"
  preamble, add a code snippet.
- **Generalizes:** DisplayInformation is the standard UWP path for DPI + orientation + HDR info; every such app
  hits this on desktop.
