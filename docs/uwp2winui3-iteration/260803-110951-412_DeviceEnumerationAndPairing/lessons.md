# Lessons — DeviceEnumerationAndPairing (iteration 0)

**Outcome:** builds ✓, launches ✓, score 11.0, 1/9 features pass, 8/9 fail.

## Root cause (single, dominant)
The migrated master/detail shell (`NavigationView` + `Frame`) never switches the content
`Frame` for scenarios 2-9. Only Scenario 1 renders because it is navigated once from a
`Loaded` handler.

`NavView_ItemInvoked` was copied nearly verbatim from the skill's
`#navigationview-frame-wiring` snippet, which resolves the invoked item via
`args.InvokedItemContainer?.DataContext is Scenario s`. Under a `MenuItemTemplate`, the
container's `DataContext` is **not reliably** the bound data object, so the guard is false
and `ScenarioFrame.Navigate` never runs.

Per Microsoft docs, `NavigationViewItemInvokedEventArgs.InvokedItem` **is** the invoked
data item — the snippet should use `args.InvokedItem`.

## Why it shipped
A 10s alive-only smoke launch + "first scenario renders?" check both pass — the dead
scenarios are silent. The skill even *warns* this is the #1 silent failure, but its own
code sample contains the bug.

## Preventable by
Correcting the skill's `MenuItemsSource` `ItemInvoked` snippet to
`if (args.InvokedItem is Scenario s) ScenarioFrame.Navigate(s.ClassType);`
