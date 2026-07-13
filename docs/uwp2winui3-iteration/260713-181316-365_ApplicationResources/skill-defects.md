# Skill defects — ApplicationResources (iteration 0)  → WILL change skill

## 1. MRT Core programmatic API not covered / not routed (WUI1001 residue)
- **Evidence:** `build-output.txt` shows 5× `WUI1001: Windows.ApplicationModel.Resources.Core → Microsoft.Windows.ApplicationModel.Resources` (scenario7/8/10/12/13). Migrated `scenario7.xaml.cs`: `using Windows.ApplicationModel.Resources.Core;` + `ResourceManager.Current.MainResourceMap.GetValue(...)`.
- **Skill state:** **absent.**
  - `MIGRATION-PATTERNS.md #resources` documented **only** `ResourceLoader`, not
    `ResourceManager`/`ResourceContext`/`ResourceMap`.
  - `unsupported-api-inventory.json` had **no** MRT Core entry → no `TODO[migrate]`
    injected → agent copied the UWP namespace verbatim.
  - `#resources` heading also lacked an `<a id>` anchor (Get-MigrationPattern couldn't route to it).
- **Root cause:** missing mapping + missing detection/routing for the MRT Core API family.
- **Proposed fix:** anchor + expand `#resources` (ResourceManager.Current→`new ResourceManager()`;
  `GetForCurrentView`/`GetForViewIndependentUse`→`CreateResourceContext()`; `GetValue`→`TryGetValue`;
  manual qualifier values); add an `adaptable` inventory entry routing to `resources`.
- **Generalizes:** programmatic MRT lookup appears in any localized/resource-driven UWP app;
  the namespace move + static→instance + `GetValue`→`TryGetValue` changes recur identically.
