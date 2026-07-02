# Skill defects — AdaptiveStreaming (iteration 1)

## 1. CS0104 Http ambiguity (Windows.Web.Http vs System.Net.Http) is undocumented
- **Problem:** 14× CS0104 (`HttpClient`/`HttpRequestMessage`/`HttpResponseMessage` ambiguous
  between `System.Net.Http.*` and `Windows.Web.Http.*`) + 2× cascading CS0535
  (`IHttpFilter.SendRequestAsync` not implemented) + a WMC9999 XAML-compiler crash — all
  from one root cause.
- **Evidence:** session-log lines 9900-9953 ("Build failed with 17 error(s)"); fix at line
  9960 (`ImplicitUsings` enable→disable); scaffold default at line 3886.
- **Skill state:** **absent.** MIGRATION-PATTERNS.md's CS0104 section only covers the XAML
  `LaunchActivatedEventArgs` ambiguity; nothing covers the Http-namespace collision or the
  `ImplicitUsings`-injects-`System.Net.Http` root cause.
- **Root cause:** Scaffold `.csproj` ships `<ImplicitUsings>enable</ImplicitUsings>` →
  global `using System.Net.Http`; UWP source keeps `using Windows.Web.Http;` → 1:1 name
  collision.
- **Proposed fix:** New MIGRATION-PATTERNS.md subsection + targeted validator hint.
- **Generalizes:** `Windows.Web.Http` is the idiomatic UWP HTTP stack and is **required**
  for `AdaptiveMediaSource`/`IHttpFilter` interception and much UWP networking. Any such app
  hits this exact CS0104 batch after the scaffold build — not adaptive-streaming-specific.
