# Lessons — AdaptiveStreaming (iteration 1)

Outcome: score 100, builds ✓, runs ✓. All parity gaps were measurement/tooling artifacts
(MediaPlayerElement AutomationId not exposed; HTML-escaped seek-button labels) — no
migration regression. The reusable signal is entirely in the **build log**.

## Key struggle (high value)
First post-migration build produced **17 errors** — **14× CS0104** Http ambiguity + **2×
CS0535** (IHttpFilter) + a cascading **WMC9999** XAML-markup-compiler crash — all from a
**single root cause**:

- The scaffold `.csproj` ships `<ImplicitUsings>enable</ImplicitUsings>`, which injects a
  global `using System.Net.Http`.
- The migrated UWP source keeps `using Windows.Web.Http;` (the UWP HTTP stack, required by
  `AdaptiveMediaSource` / `IHttpFilter` request interception).
- Result: `HttpClient`, `HttpRequestMessage`, `HttpResponseMessage` are all **ambiguous**
  → CS0104; the `IHttpFilter.SendRequestAsync` override then bound the wrong types → CS0535;
  MarkupCompilePass2 then crashed (WMC9999) because the C# assembly failed to build.

**Fix that worked (session-log line 9960):** set `<ImplicitUsings>disable</ImplicitUsings>`.
Cleared all 14 CS0104 + 2 CS0535 + the WMC9999 cascade at once.
Alternatives: `<Using Remove="System.Net.Http" />`, or per-file
`using HttpClient = Windows.Web.Http.HttpClient;`.

## Special APIs
`Windows.Web.Http.{HttpClient,HttpRequestMessage,HttpResponseMessage,IHttpFilter}` — UWP
networking/media code uses this stack, not `System.Net.Http`; the type names collide 1:1.

## Env issue
Rebuild once failed with a file-lock (dll in use) because a launched app instance was still
running — transient, not a code defect.

## Preventable by
1. A MIGRATION-PATTERNS.md entry for the Windows.Web.Http / System.Net.Http CS0104
   ambiguity + the ImplicitUsings root cause and fix.
2. Validate-UwpMigration.ps1 emitting a targeted hint when CS0104 references Http types.
