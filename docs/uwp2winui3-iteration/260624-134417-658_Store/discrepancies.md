# Discrepancies — Store (improve iteration 1)

Score **93/100** — 6 pass, 1 partial, 0 fail. Builds and runs.

- **#4 Managed consumable product → partial.** Scoring flagged the `QuantityComboBox` as
  missing. **Not a migration defect:** the migrated `Scenario4_ConsumableProduct.xaml`
  contains the `QuantityComboBox`; the scenario-4 UIA capture (`parity/winui3/ui/04.json`)
  actually shows scenario-3 ("Unmanaged Consumables") content. Eval-capture/navigation
  artifact → deferred to human, no migration-skill change.
- **#7 Business to Business.** Passed after the build-fix loop cleared a `CS0104`
  `HttpClient`/`HttpResponseMessage` ambiguity (`System.Net.Http` vs `Windows.Web.Http`).
  This axis is not covered by the skill's `CS0104` section → skill-coverage-gap.
- **Blank WinUI screenshots (all scenarios).** Headless composition artifact; UIA trees
  are correct. No migration action.
