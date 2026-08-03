# Discrepancies — CustomHidDeviceAccess

Score **25/100**, builds ✓, runs ✓.

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Connecting To Device | pass | Renders and matches UWP golden. |
| 2 | Feature Reports | **fail** | Dead scenario — Frame never switches, shows Scenario 1. |
| 3 | Input Report Events | **fail** | Dead scenario. |
| 4 | Input and Output Reports | **fail** | Dead scenario. |

All three failures share one root cause: the `navigationview-frame-wiring` skill anchor's
recommended pattern (constructor `SelectedItem = Scenarios[0]` + navigate only from
`SelectionChanged`) does not reliably switch the content Frame for `MenuItemsSource`
data items. Generalizes to every multi-scenario UWP→WinUI 3 migration.
