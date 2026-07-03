# Skill Coverage Gaps — DpiScaling (index 0)

## 1. DisplayInformation DPI path is under-specified (orientation-only expansion)
- **Problem:** DPI migrations need a logical-DPI readout, a live update on scale change, and a safe scale read. Skill maps `DisplayInformation.GetForCurrentView()` → `XamlRoot.RasterizationScale` but omits the `LogicalDpi` formula, the `DpiChanged` event mapping, and the read-after-`Loaded` timing.
- **Evidence:** migrated `Scenario1.xaml.cs` — `logicalDpi = 96.0 * XamlRoot.RasterizationScale`, `XamlRoot.Changed += OnXamlRootChanged`, read from `OnLoaded` with `if (XamlRoot != null)` guard in `OnNavigatedTo`.
- **Covered at:** `MIGRATION-PATTERNS.md#getforcurrentview` + `### DisplayInformation is view-bound` (says "only covers the DPI use case" then expands **orientation** only); XamlRoot-null-until-loaded rule exists only in the ContentDialog context.
- **Why missed:** under-emphasized (DPI path acknowledged but not filled in).
- **Improvement:** add a DPI mapping table (`LogicalDpi`→`96*RasterizationScale`, `RawPixelsPerViewPixel`/`ResolutionScale`→`RasterizationScale`, `DpiChanged`→`XamlRoot.Changed`) + one timing line (RasterizationScale null in ctor/`OnNavigatedTo`; read from `Loaded`, refresh on `XamlRoot.Changed`).
- **Generalizes:** every DPI-aware sample uses these members + subscribes to DpiChanged + reads scale during init → prevents a recurring null-XamlRoot / silent-blank-page trap.
