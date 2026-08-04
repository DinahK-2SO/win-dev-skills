# Skill defects (WILL change skill) — DeviceEnumerationAndPairing

## 1. Data-bound NavigationView `ItemInvoked` snippet uses the wrong item source
- **Problem:** Scenarios 2-9 never navigate; 8/9 features fail.
- **Skill state:** WRONG — `MIGRATION-PATTERNS.md #navigationview-frame-wiring`
  `MenuItemsSource` snippet reads `args.InvokedItemContainer?.DataContext is Scenario s`.
- **Root cause:** Under a `MenuItemTemplate`, the container's `DataContext` is not
  reliably the bound data object, so the cast fails and `Navigate` never runs. Docs:
  `InvokedItem` IS the invoked data item.
- **Fix:** Use `if (args.InvokedItem is Scenario s) ScenarioFrame.Navigate(s.ClassType);`
  and drop the empty first `if` block.
- **Generalizes:** Every SDK-sample / master-detail migration copies this snippet; the
  fix is the framework-guaranteed route for all data-bound NavigationViews.
