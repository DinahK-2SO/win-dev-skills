# Lessons — AdaptiveStreaming

**Outcome:** WinUI 3 candidate did not build → 0/7 features. Two generalizable root causes.

## Root cause 1 — Linked shared-content sources never entered the project (build-fatal)
- UWP SDK samples pull source from a sibling `SharedContent` folder via
  `<Compile Include="$(SharedContentDir)\cs\Logging\...">` + `<Link>`.
- `Initialize-UwpMigration.ps1` only copied files under `-Source`, so the entire
  `SDKTemplate.Logging` helper set (`LogView`, `MediaPlayerLogger`, `MediaSourceLogger`,
  `MediaPlaybackItemLogger`, `AdaptiveMediaSourceLogger`, extensions) was missing.
- Result: `CS0234 namespace 'Logging' does not exist`, `CS0246` for every logger type,
  across Scenario2–7, ContentSelector, PlayReadyHelper. The agent even mapped stale
  `obj\...\Shared\Logging\*.g.cs` generated copies instead of the real source.

## Root cause 2 — Windows.Web.Http vs System.Net.Http ambiguity (CS0104/CS0535)
- WinUI 3 has both HTTP stacks in scope; `HttpClient`/`HttpRequestMessage`/`HttpResponseMessage`
  become ambiguous (`CS0104`). The skill's CS0104 guidance only covered XAML namespaces.
- `CS0535` on `IHttpFilter.SendRequestAsync` is the downstream symptom of resolving the
  ambiguity by switching the filter signature to `System.Net.Http` types.

## Helpful / problematic tools
- Helpful: bootstrap copy + namespace rewrite + TODO seeding worked for in-cone files.
- Problematic: bootstrap had no concept of `<Link>`ed out-of-cone shared sources.
