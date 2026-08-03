# Skill defects — CustomHidDeviceAccess

## 1. `navigationview-frame-wiring` anchor produces dead scenarios (WILL change skill)
- **Problem:** NavigationView highlights but content Frame never switches; 3/4 scenarios fail.
- **Skill state:** WRONG. The anchor recommends `NavView.SelectedItem = Scenarios[0]` in the
  constructor + navigate only from `SelectionChanged`, with a first-scenario-only check.
- **Root cause:** Constructor `SelectedItem` assignment does not reliably raise
  `SelectionChanged`; for `MenuItemsSource` data items, selection doesn't reliably drive the
  Frame. Navigation never fires. Alive-only smoke launch + first-scenario check miss it.
- **Fix:** (1) Explicit initial `Frame.Navigate` on `Loaded`; (2) handle `ItemInvoked`
  (reliable per click for data-bound items); (3) falsifiable check must verify switching to a
  SECOND scenario, not just first render.
- **Generalizes:** Every UWP SDK sample and most real UWP apps use this scenario-list + Frame
  idiom; the pattern is a recurring silent failure across the whole class.
