# Lessons — ApplicationResources (UWP → WinUI 3)

Score: **88** (12/13 scenarios faithful; 1 dropped, 1 partial).

## Dev-agent struggles (high value)
- **scenario9 "Override Languages" dropped.** Agent deferred `scenario9.xaml.cs` because
  the skill's `#getforcurrentview` section states *"None of the GetForCurrentView()
  patterns work in WinUI 3 desktop."* That absolute claim is wrong for the **resource**
  flavors: `ResourceContext.GetForCurrentView()` → `new ResourceContext()` and
  `ResourceLoader.GetForCurrentView()` → `new ResourceLoader()`. The agent had already
  applied the view-independent `ResourceContext` pattern successfully in scenarios 7/8/10,
  yet still removed Scenario9 from `constants.cs`. **Preventable by** carving the resource
  flavors out of the "no equivalent" claim.
- **scenario2 images blank.** The qualifier-variant image tree (`shared/images/`, incl.
  `en-US/`, `ja/` and `.scale-*/.contrast-*` files) was never copied into the project;
  only `shared/strings` and `shared/xaml` came across. **Preventable by** guidance to
  carry in-app image/file resource variants (as Content) and verify each `Image Source`.

## Errors encountered
- Blank images (scenario2) → missing physical resource variants → copy the variant tree.
- Dropped Override Languages (scenario9) → false "no equivalent" for ResourceContext →
  migrate with `new ResourceContext()` + qualifier override.

## Doc error
- `MIGRATION-PATTERNS.md#getforcurrentview`: overbroad "None of the GetForCurrentView()
  patterns work" — must exclude the ResourceLoader/ResourceContext flavors.
