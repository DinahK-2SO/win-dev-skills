# Skill defects (WILL change skill) — ApplicationResources

1. **Overbroad GetForCurrentView() claim drops resource scenarios.**
   `MIGRATION-PATTERNS.md#getforcurrentview` says *"None of the GetForCurrentView()
   patterns work in WinUI 3 desktop"* and lists only windowing APIs. This made the agent
   defer `ResourceContext.GetForCurrentView()` (scenario9 "Override Languages"), dropping
   the feature — despite the trivial replacements `new ResourceContext()` /
   `new ResourceLoader()` it used successfully in scenarios 7/8/10.
   *Fix:* narrow the claim to view/windowing singletons; add resource-flavor replacement
   rows; extend the MRT section with ResourceContext runtime qualifier override.
   *Generalizes:* every localizable app doing runtime language/scale/contrast override.

2. **No guidance to carry in-app image/file resource variants.**
   Skill only reconciles manifest logo assets. The qualifier-variant image tree
   (`shared/images/` incl. `en-US/`, `ja/`, `.scale-*/.contrast-*`) was dropped →
   scenario2 images blank.
   *Fix:* add an "in-app image & file resource variants" subsection (copy the variant
   tree as Content, including from `shared/`; verify each `Image Source`/`ms-appx` path).
   *Generalizes:* nearly all UWP SDK samples use a shared/ resource folder.
