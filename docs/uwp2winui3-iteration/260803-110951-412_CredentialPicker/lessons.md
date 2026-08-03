# Lessons — CredentialPicker (UWP→WinUI 3)

**Outcome:** builds (0 errors), launches, but **score 0/3**. Shell renders; every
scenario content Frame is blank.

## Root cause (single, high-leverage)
The `NavigationView` was populated with `MenuItemsSource="{x:Bind Scenarios}"`, but the
`SelectionChanged` handler did:

```csharp
if (args.SelectedItem is NavigationViewItem item && item.Tag is Scenario s)
    ScenarioFrame.Navigate(s.ClassType);
```

With **`MenuItemsSource`**, `args.SelectedItem` is the **bound data item** (`Scenario`),
**not** a `NavigationViewItem`. The cast fails silently → `Navigate` is never called →
content Frame stays blank on every page. The constructor also set
`NavView.SelectedItem = NavView.MenuItems[0]`, but `MenuItems` is empty when
`MenuItemsSource` is used, so even the initial navigation never fired.

**Fix:** navigate off the data item —
`if (args.SelectedItem is Scenario s) ScenarioFrame.Navigate(s.ClassType);` — and set the
initial selection from the source collection (`Scenarios[0]`). When items are literal
`NavigationViewItem`s in `MenuItems` instead, read `item.Tag`.

## Why it slipped through
- **Silent failure:** no build or runtime error, so the dev-agent had no signal to retry.
- The smoke-launch validator confirms the window activates but cannot see that scenario
  content never rendered.

## Generalizable takeaway
The skill recommends `NavigationView + Frame` for the ubiquitous UWP SDK-sample
`MainPage + ListView + Frame` idiom but ships **no working wiring pattern**. Every SDK
sample uses this scenario-list shell, so the missing pattern (and the
`MenuItemsSource`↔`SelectedItem` type trap) will recur widely.
