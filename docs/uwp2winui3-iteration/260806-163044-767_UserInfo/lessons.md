# UserInfo migration lessons

- **Highest-leverage gap:** the bootstrap copied only files physically under the UWP project. The csproj linked 17 shared App/MainPage/style/asset files from sibling trees, forcing manual reconstruction and causing duplicate definitions, missing-resource startup crashes, and visual drift.
- **Command reliability:** `winapp build` is unsupported in this environment. Use an explicit `dotnet build <project.csproj> -p:Platform=x64`.
- **Serialization matters:** scaffold/bootstrap/self-check and build/launch/validation are dependent operations. Parallel execution caused false self-checks, `input.json` locks, `CS2012`, `WMC9999`, and contradictory launch results.
- **Special API:** `UserWatcher` callbacks require a cached `Microsoft.UI.Dispatching.DispatcherQueue`; qualify the type when `Windows.System` is also imported.
- **Runtime diagnosis:** `Test-AppLaunch.ps1` correctly exposed `0xc000027b`, but the actual cause was an omitted linked resource dictionary. Carrying all linked XAML/resources prevents this class of failure.
- **Scored parity:** behavior passed, but source `RequestedTheme="Dark"`, display title, and branding were not preserved, leaving every feature partial.

See `lessons.json` for all distinct errors, root causes, and fixes.
