# Lessons — AdaptiveStreaming (iteration 1)

## Tools Helpful
- **Bootstrap script**: Correctly scaffolded, copied 121 files, injected TODO markers.
- **Validate-UwpMigration.ps1**: Caught UWP residue comment and 121 rows stuck at `copied`.

## Failed APIs
- **Windows.Web.Http.HttpClient** — CS0104 ambiguity with `System.Net.Http.HttpClient` caused by .NET SDK `ImplicitUsings`. Fixed by adding `<Using Remove="System.Net.Http" />` to `.csproj`.

## Errors Encountered
1. **CS0104** (14+ occurrences): `HttpClient`, `HttpRequestMessage`, `HttpResponseMessage` ambiguous between `System.Net.Http` and `Windows.Web.Http`. Root cause: ImplicitUsings.
2. **CS0535**: `IHttpFilter.SendRequestAsync(HttpRequestMessage)` not implemented — cascading from the same ambiguity.

## Dev Agent Struggles
1. **Build output polling loop** (~7 min wasted): Agent piped `dotnet build` through `Select-String` which swallowed all output on a clean build. Skill warns about `Where-Object` but not `Select-String`. 5 retries before killing the shell.
2. **CS0104 HttpClient ambiguity** (1 turn): Agent diagnosed and fixed immediately, but the skill doesn't cover `System.Net.Http` vs `Windows.Web.Http` — only `Windows.UI.Xaml` vs `Microsoft.UI.Xaml` ambiguities.

## Environment Issues
- Smoke launch WARN (0x80070003 package registration failure) — environment issue, not migration defect.
