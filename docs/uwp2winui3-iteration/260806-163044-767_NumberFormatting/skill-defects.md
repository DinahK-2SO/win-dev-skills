# Skill defects

- **Linked project items absent:** bootstrap inventory ignored csproj `Include`/`Link` items outside `-Source`, omitting shared XAML, code, styles, and assets.
- **Wrong shell mapping:** the skill encouraged replacing supported SDK-sample `SplitView`/`ListView`/`Frame` structure with `NavigationView`, causing the scored theme/footer/layout divergence.
- **No heading sizing invariant:** replacement chrome allowed long headings to extend beyond the window.
- **No scroll-boundary invariant:** all seven functional outputs became below-view or partially clipped.
- **Invalid build command:** `winapp build` does not exist; use `dotnet build <path-to-csproj>`.
