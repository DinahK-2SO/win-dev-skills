# Lessons — NetworkConnectivity (index 0)

**Outcome:** Build succeeded (0 errors, warnings only), app launches, score 100/100 (3/3 features pass, 0 parity discrepancies).

## Tools that helped
- `Initialize-UwpMigration.ps1` — scaffold + namespace rewrite; left only code-level fixes.
- `Validate-UwpMigration.ps1` — gated done-check on a clean `dotnet build` (`[PASS]` at log 4776/4833).
- Native `dotnet build` — surfaced the real errors (log 4221).

## Errors encountered
1. **CS0104 `HttpClient` ambiguous** between `System.Net.Http.HttpClient` and `Windows.Web.Http.HttpClient` (`Helpers.cs` 47).
   - **Root cause:** the WinUI 3 SDK-style csproj has `<ImplicitUsings>enable</ImplicitUsings>`, which globally imports `System.Net.Http`. The UWP source used the unqualified WinRT `Windows.Web.Http.HttpClient`, so the simple name now resolves to two types.
   - **Fix:** fully qualify → `Windows.Web.Http.HttpClient httpClient = new Windows.Web.Http.HttpClient();` (log 4305).
2. **WMC0909 / WMC1111 / WMC9999** x:Bind DataType errors in `MainPage.xaml`.
   - **Root cause:** *cascade* from error #1. `WMC1509 "No LocalAssembly parameter given during MarkupCompilePass2"` shows the C# compile failed, so `x:Bind` against the project-local `Scenario` type could not resolve. These vanish once the project compiles.
   - The agent also switched the `ItemTemplate` from `x:Bind` to classic `Binding`; that was likely unnecessary once CS0104 was fixed.

## Dev-agent struggle
- One build→fix→rebuild cycle. Fixing the HttpClient collision was the necessary change; the XAML edits reacted to a cascade.
- **Preventable by:** a MIGRATION-PATTERNS CS0104 entry covering **.NET-vs-WinRT simple-name collisions under `ImplicitUsings`** (canonically `HttpClient`), so the agent fully-qualifies the WinRT type up front and treats the follow-on XAML markup errors as a cascade of the failed C# compile.

## Note on warnings (benign, no score impact)
CS8618/CS8602 (nullable) and CA1416 (platform-version) warnings remained; they do not affect build or parity.
