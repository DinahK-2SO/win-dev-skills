# Discrepancies — DeviceEnumerationAndPairing

- **Score:** 11.0 | builds ✓ | runs ✓ | 1 pass / 8 fail.
- **Dominant issue:** data-bound `NavigationView` `ItemInvoked` handler never navigates
  scenarios 2-9 because it reads `InvokedItemContainer.DataContext` instead of
  `args.InvokedItem`.
- Scenario 1 renders only because it is navigated once on `Loaded`.
- All 8 failing scenarios share the identical root cause.
