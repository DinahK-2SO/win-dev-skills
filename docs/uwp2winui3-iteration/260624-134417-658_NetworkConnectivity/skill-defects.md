# Skill defects — NetworkConnectivity (index 0)

## 1. CS0104 `HttpClient` ambiguity (System.Net.Http vs Windows.Web.Http) is not covered

- **Evidence:** `session-log.txt` 4212-4213 (errors), 4221 (build failed), 4305 (fix = fully qualify `Windows.Web.Http.HttpClient`).
- **Skill search:** grepped `HttpClient`, `Windows.Web.Http`, `ImplicitUsings`, `ambiguous`, `CS0104`. The existing CS0104 section (`MIGRATION-PATTERNS.md` line 9) covers **only** the `Windows.UI.Xaml`↔`Microsoft.UI.Xaml` family (LaunchActivatedEventArgs, Application, RoutedEventArgs). The BCL-vs-WinRT collision is **absent**.
- **State:** absent.
- **Root cause:** the scaffold csproj has `<ImplicitUsings>enable</ImplicitUsings>` → global `using System.Net.Http;`. UWP code using the unqualified WinRT `Windows.Web.Http.HttpClient` then has two `HttpClient` types in scope.
- **Fix:** add a CS0104 subsection for ImplicitUsings/BCL-vs-WinRT simple-name collisions (canonical: `HttpClient`); fix = fully-qualify/alias the WinRT type. Note the cascading `x:Bind`/`WMC1509` markup errors are a byproduct of the failed C# compile, not a separate XAML bug.
- **Generalizes:** `ImplicitUsings` is in every WinUI 3 scaffold; `Windows.Web.Http.HttpClient` is common across UWP HTTP/networking/streams samples → this recurs beyond NetworkConnectivity.
