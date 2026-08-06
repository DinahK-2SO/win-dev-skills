# LampArray migration lessons

- **Bootstrap worked but was incomplete:** it generated mapping/TODO artifacts, yet copied only four physical files and missed 17 linked MSBuild items. Manual recovery consumed roughly ten turns and caused the migration timeout.
- **Dependency reconciliation missed a framework-specific replacement:** `Win2D.uwp` must become `Microsoft.Graphics.Win2D`; otherwise the unchanged `Microsoft.Graphics.Canvas` namespaces do not resolve.
- **Compiler-name collisions need explicit handling:** a project namespace can shadow a platform type (`LampArray`), while importing `Windows.System` can make `DispatcherQueue` ambiguous. Use aliases rather than broad namespace renames or deleting needed imports.
- **Build ordering matters:** the initial scaffold/bootstrap/self-check race cost one retry, and the absence of a migration-time build left all compiler errors for scoring to discover.
- **XAML errors were cascading:** the unresolved `local:Scenario` diagnostics followed C# compilation failure and missing local assembly output; fix earlier C# errors before rewriting valid `x:DataType` markup.

## Dev-agent struggles

- Turns 1-2: parallel bootstrap commands raced scaffolding; recovered on one retry.
- Turns 6-15: browsed generated output and SharedContent, then manually recreated linked files; not resolved before timeout.
- Entire trial: never reached the prominently required build/validator gates.

## Errors encountered

- Target-not-found bootstrap race.
- Missing WinUI Win2D reference (`CS0234`, `CS0246`).
- Project namespace shadowing a platform type (`CS0118`).
- Ambiguous dispatcher type (`CS0104`).
- Cascading XAML compiler failures (`WMC1509`, `WMC0909`, `WMC1111`, `WMC9999`).

