# Lessons — DpiScaling (index 0)

**Outcome:** score 100, builds, runs, 0 discrepancies. Clean migration. Value is in the *process*: the driver had to self-derive DPI-specific mappings the skill does not spell out.

## Tools that helped
- `Initialize-UwpMigration.ps1` — bootstrap, namespace rewrite, mapping seed.
- `Get-MigrationPattern.ps1` — pulled `getforcurrentview` + `windowing` anchors.
- `Validate-UwpMigration.ps1` — PASS; build clean (4 nullable warnings).

## Failed / undocumented APIs (self-derived)
- `DisplayInformation.LogicalDpi` → derived `logicalDpi = 96.0 * XamlRoot.RasterizationScale` (no formula in skill).
- `DisplayInformation.DpiChanged` event → used `XamlRoot.Changed` (no event mapping in skill; only orientation's `OrientationChanged`→`AppWindow.Changed` documented).

## Special handling
- `XamlRoot.RasterizationScale` is null/invalid until `Loaded`. Read from `Loaded`, guarded `OnNavigatedTo` with `if (XamlRoot != null)`, deferred first navigation to `Window.Activated`.

## Dev-agent struggle (high value)
- DisplayInformation section says the GetForCurrentView row "only covers the DPI use case" then expands **orientation** only — the DPI path (LogicalDpi formula, DpiChanged event, read-after-Loaded timing) is undocumented. A capable model recovered; a weaker one on another DPI-aware sample could read `RasterizationScale` in a constructor/`OnNavigatedTo` (null → blank/crash) or fail to wire live DPI updates.
- **Preventable by:** add a DPI mini-mapping + timing rule to the DisplayInformation section.

## Env / measurement caveats (NOT migration defects; eval-tool limits)
- WinUI 3 swap-chain screenshots come back blank in headless session; UWP Scenario-2 golden not capturable. Verified via UIA. Out of scope for the migration skill.
