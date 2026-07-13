# Lessons — ApplicationResources (iteration 0)

**Outcome:** score 100, builds ✅, runs ✅. Faithful 13-scenario migration. The one
real, generalizable defect is **UWP MRT residue** that the analyzer flagged but nobody
acted on.

## Errors encountered
- **WUI1001** on `scenario7/8/10/12/13.xaml.cs`:
  `Windows.ApplicationModel.Resources.Core → Microsoft.Windows.ApplicationModel.Resources`.
  Root cause: migrated code kept the UWP MRT namespace + `ResourceManager.Current` /
  `ResourceContext.GetForViewIndependentUse()` / `ResourceMap.GetValue`. Compiles via the
  compat projection but is UWP-only API residue.

## Dev-agent struggle (highest value)
- Agent never surfaced WUI1001 and shipped the residue because:
  1. **No TODO nudge** — the MRT Core `ResourceManager`/`ResourceContext` family is absent
     from `unsupported-api-inventory.json`, so `Initialize-UwpMigration.ps1` injected no
     `TODO[migrate]` marker on those lines.
  2. **No mapping** — `MIGRATION-PATTERNS.md #resources` documented only `ResourceLoader`,
     not the `ResourceManager`/`ResourceContext`/`ResourceMap` API this scenario uses.

## Doc error
- `#resources` section covered only `ResourceLoader.GetForCurrentView()`. Missing the
  programmatic MRT lookup mapping (`ResourceManager.Current` → `new ResourceManager()`;
  `GetForViewIndependentUse/GetForCurrentView` → `CreateResourceContext()`; `GetValue` →
  `TryGetValue`; qualifiers must be set manually).

## Tooling limitation
- Inventory `adaptable` list has no MRT Core entry → no TODO routing to `#resources`.
