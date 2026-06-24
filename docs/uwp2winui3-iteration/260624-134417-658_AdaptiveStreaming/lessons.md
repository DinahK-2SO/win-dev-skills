# Lessons — AdaptiveStreaming (UWP → WinUI 3)

**Outcome:** Build SUCCEEDED; independent score 100 (7/7 pass). No migration *defects* per
the scorer. But the dev-agent burned several build iterations on two recurring,
generalizable build errors that the migration skill does not name.

## Errors encountered (root cause → fix)

1. **CS0104 — `HttpClient` / `HttpRequestMessage` / `HttpResponseMessage` ambiguous between
   `System.Net.Http.*` and `Windows.Web.Http.*`** (ContentSelector, the IHttpFilter
   logger, Scenario2–7).
   - *Root cause:* the WinUI 3 scaffold sets `<ImplicitUsings>enable</ImplicitUsings>`,
     which injects a global `using System.Net.Http;`. UWP networking code uses
     `Windows.Web.Http`, so the two `HttpClient` families collide.
   - *Fix:* keep `Windows.Web.Http` and drop the `System.Net.Http` using (or alias).
     `AdaptiveMediaSource`/`IHttpFilter` request-modification code **must** stay on
     `Windows.Web.Http`.

2. **CS0535 — `IHttpFilter.SendRequestAsync(HttpRequestMessage)` not implemented.**
   - *Root cause:* downstream of #1 — with `System.Net.Http` in scope the override's
     `HttpRequestMessage`/`HttpResponseMessage` bound to the wrong namespace, so the
     `IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress> SendRequestAsync(...)`
     member no longer matched the WinRT `IHttpFilter` contract.
   - *Fix:* resolve #1; the signature then matches.

3. **CS0103 — `Colors` does not exist** (LogView.xaml.cs).
   - *Root cause:* `Initialize-UwpMigration.ps1` rewrites only `Windows.UI.Xaml`, **not**
     the sibling `Windows.UI` (non-Xaml) namespaces. `Colors` (was `Windows.UI.Colors`) was
     used unqualified, so nothing brought it into scope.
   - *Fix:* add `using Microsoft.UI;` (home of `Colors`/`ColorHelper`).

## Generalization
Both classes of error recur in any media/networking UWP sample: `Windows.Web.Http` +
`IHttpFilter` is the standard way UWP modifies adaptive-streaming requests, and unqualified
`Windows.UI.*` helpers (`Colors`, `ColorHelper`, `FontWeights`) are everywhere. Neither is
named in the skill's "Common build errors" list today.
