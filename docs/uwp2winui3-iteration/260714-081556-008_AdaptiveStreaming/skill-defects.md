# Skill Defects (WILL change skill) — AdaptiveStreaming

## 1. CS0104 HttpClient / Windows.Web.Http ambiguity is undocumented
- **Evidence:** session-log.txt:9143-9165 (8 CS0104 across ContentSelector + Scenario2-7 + AdaptiveMediaSourceHttpFilterLogger), cascading into WMC1509/WMC9999 hang (9431-9732). Fixed via `<Using Remove="System.Net.Http" />` (9334); clean build (9958).
- **Skill state:** absent. MIGRATION-PATTERNS.md only documents CS0104 for `LaunchActivatedEventArgs`; the generic advice ("remove the stale UWP using") is actually *wrong* here.
- **Root cause:** Scaffold `ImplicitUsings=enable` adds a global `using System.Net.Http` that collides with the WinRT `Windows.Web.Http` stack the media code keeps. Deleting a using doesn't help (ImplicitUsings re-adds it).
- **Fix:** New subsection prescribing `<Using Remove="System.Net.Http" />` in the `.csproj`, and NOT rewriting the WinRT HTTP calls (IHttpFilter / AdaptiveMediaSource interception depends on them).
- **Generalizes:** Windows.Web.Http is common (HTTP, OAuth filters, adaptive-streaming interception); every such app hits this against an ImplicitUsings WinUI scaffold.
