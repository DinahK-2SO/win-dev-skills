# Skill Defects — AdaptiveStreaming (iteration 1)

## 1. CS0104 HttpClient ambiguity (System.Net.Http vs Windows.Web.Http)

- **Category**: skill-defect (absent)
- **Evidence**: session-log.txt L8234-8249 — 14+ CS0104 errors, 2 CS0535 errors
- **Skill search**: Grepped for `HttpClient`, `System.Net.Http`, `Windows.Web.Http`, `ImplicitUsings` — no matches in MIGRATION-PATTERNS.md or SKILL.md
- **Root cause**: The skill's CS0104 section only covers `LaunchActivatedEventArgs` (Windows.UI.Xaml vs Microsoft.UI.Xaml). It doesn't mention the `System.Net.Http` vs `Windows.Web.Http` collision caused by `<ImplicitUsings>enable</ImplicitUsings>` in .NET SDK projects.
- **Fix**: Add a new `### CS0104: HttpClient ambiguous` section to MIGRATION-PATTERNS.md explaining the ImplicitUsings mechanism and the `<Using Remove="System.Net.Http" />` fix.
- **Generalizes**: Any UWP code using `Windows.Web.Http` types (IHttpFilter, HttpClient, HttpRequestMessage) hits this when migrated to .NET SDK-style projects.
