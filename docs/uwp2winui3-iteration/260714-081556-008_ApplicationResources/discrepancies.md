# Discrepancies — ApplicationResources

- **fail — Override Languages (scenario9):** dropped from `constants.cs`; deferred on the
  false premise that `ResourceContext.GetForCurrentView()` has no WinUI 3 desktop
  equivalent. Skill gap: overbroad `#getforcurrentview` guidance.
- **partial — File Resources In XAML (scenario2):** both Image controls blank; physical
  qualifier-variant image files (`shared/images/`) never copied. Skill gap: no guidance to
  carry in-app image/file resource variants as Content.

12/13 scenarios otherwise faithful (score 88).
