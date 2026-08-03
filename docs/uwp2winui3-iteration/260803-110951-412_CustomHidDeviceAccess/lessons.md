# Lessons — CustomHidDeviceAccess (UWP→WinUI 3)

**Outcome:** score 25/100, builds ✓, runs ✓, 1/4 scenarios pass. Scenarios 2–4 are
"dead": the NavigationView item highlights but the content `Frame` never switches —
it keeps showing Scenario 1.

## Root cause (high value)
The migration skill's `navigationview-frame-wiring` anchor recommends:
```csharp
NavView.SelectedItem = Scenarios[0];   // in constructor
// navigate ONLY from SelectionChanged
```
The dev-agent followed this **verbatim** (its code even cites the anchor). But:
- Setting `SelectedItem` in the constructor (before item containers realize) does **not
  reliably raise** `SelectionChanged`.
- With `MenuItemsSource` data items, runtime selection does not reliably drive the Frame.

Result: content Frame never switches. The **smoke launch passed** (process alive) and the
anchor's falsifiable check only verified the *first* scenario, so nothing flagged it.

## Fix (generalizable)
- Navigate the Frame **explicitly on `Loaded`** for the initial scenario (don't rely on
  a constructor `SelectedItem` side-effect).
- Handle **`NavigationView.ItemInvoked`** (fires reliably per click for data-bound items)
  to navigate on selection.
- Falsifiable check must verify **switching between two scenarios**, not just first render.

## Tooling notes
- `Get-MigrationPattern.ps1`, `Initialize-UwpMigration.ps1` worked well.
- `Test-AppLaunch.ps1` smoke launch is alive-only; blind to dead-scenario navigation.
