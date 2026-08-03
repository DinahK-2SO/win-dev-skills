# Skill defects — CredentialPicker (WILL change skill)

## 1. No wiring pattern for `NavigationView + Frame` (SDK-sample scenario list)
- **Problem:** Shell renders, scenario content Frame blank on every page → score 0/3.
- **Evidence:** `migration-score.json` (all 3 fail, "content frame blank; nav item
  selects but no page content"); `MainPage.xaml.cs` `SelectionChanged` casts
  `args.SelectedItem` to `NavigationViewItem` while `MenuItemsSource` binds `Scenario`
  data items.
- **Skill state:** **absent.** SKILL.md line 96 maps the SDK-sample idiom to
  `NavigationView + Frame` but no wiring code exists anywhere.
- **Root cause:** With `MenuItemsSource`, `args.SelectedItem` is the bound **data item**,
  not a `NavigationViewItem`, so the cast fails silently and `ScenarioFrame.Navigate` is
  never called. The initial `SelectedItem = MenuItems[0]` is also empty under
  `MenuItemsSource`.
- **Proposed fix:** Add a copy-pasteable `NavigationView + Frame` wiring snippet to
  MIGRATION-PATTERNS.md (navigate off the data item / `item.Tag`; initial navigate from
  the source collection; falsifiable "frame must contain scenario controls" check) and
  cross-link from the SKILL.md shell-mapping table.
- **Generalizes:** Every UWP SDK sample uses this idiom and the skill steers all of them
  to `NavigationView + Frame`; the type trap is the default mistake.
