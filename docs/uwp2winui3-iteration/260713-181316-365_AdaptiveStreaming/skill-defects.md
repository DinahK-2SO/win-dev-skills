# Skill defects — AdaptiveStreaming (WILL change skill)

## 1. Migrated shell does not scroll-host scenario content → tall pages clip
- **Evidence:** `migration-score.json` Live Seekable Range = *partial* ("bottom layout is cramped/truncated … seek-offset buttons not found in UIA tree"), `discrepancies.json` severity=medium; migrated `MainPage.xaml` has `<Frame x:Name="ScenarioFrame"/>` directly under `NavigationView` — no page-level `ScrollViewer` anywhere in the app.
- **Skill state:** absent. Only ScrollViewer mention is the `Hub→ScrollViewer` control-swap row; Shell Conversion / Navigation invariants only guarantee page *reachability*, not control reachability within a tall page.
- **Root cause:** WinUI 3 window is smaller than UWP's and `NavigationView`/`Frame` content doesn't scroll; a page taller than the window clips its bottom controls out of the render + UIA tree.
- **Fix:** Add a Navigation invariant: scroll-host the scenario content region (`<ScrollViewer VerticalScrollBarVisibility="Auto">` around the content `Frame`); caveat that star-sized fill elements need a `MinHeight`.
- **Generalizes:** Every UWP→WinUI 3 shell conversion loses UWP's scrolling host; any tall page clips in a fixed capture window. General rule, not scenario-specific.
