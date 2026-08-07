# TextSuggestion migration lessons

- **Best tooling:** the bootstrap generated useful mapping artifacts, `dotnet build` surfaced precise errors, and the validator caught incomplete bookkeeping and proved the final launch.
- **Primary tooling gap:** the bootstrap ignored externally linked csproj inputs, forcing manual discovery and reconstruction of shared App/MainPage/styles/assets.
- **Wrong command:** `winapp build` is not supported by the installed CLI; an explicit platform-qualified `dotnet build` is required before `Test-AppLaunch.ps1`.
- **Build errors:** explicit SDK-style `Page Include` caused NETSDK1022; property-element `x:Bind` caused WMC0503; nullable UWP assumptions caused CS86xx warnings.
- **Runtime/tool issue:** plain `dotnet build` produced a layout `Test-AppLaunch.ps1` did not search.
- **Scored outcome:** all APIs and scenarios worked, but shell theme/chrome/navigation geometry/text wrapping drift reduced all three features to partial.

## Dev-agent struggles

1. Turns 4-12 were spent finding and manually recreating linked SharedContent omitted by the bootstrap.
2. Turns 13-23 required repeated build/launch recovery from incorrect command guidance and missing XAML/project diagnostics.
3. The migration never detected visual shell drift because the NavigationView pattern covers behavior but not concrete visual fidelity.
