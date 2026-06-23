# Skill coverage gaps (present but unclear → WILL change skill)

## 1. CS0104 ambiguity documented only for the Xaml axis, not `Windows.Web.Http`
- **Problem:** `CS0104 'HttpMethod' / 'HttpCompletionOption' ambiguous` between
  `System.Net.Http` and `Windows.Web.Http` (Scenario3_RequestModification.xaml.cs:323/326).
- **Evidence:** migration-score.json build errors #2/#3; source uses
  `using Windows.Web.Http;` + `Windows.Web.Http.Filters` and calls
  `HttpCompletionOption.ResponseHeadersRead`.
- **Covered at:** the CS0104 section in "Common build errors" — but it is framed entirely
  around `Windows.UI.Xaml` ↔ `Microsoft.UI.Xaml` and only generalizes to *Xaml* type
  names.
- **Why missed:** under-emphasized — the Http collision axis is never named.
- **Improvement:** add the `System.Net.Http` ↔ `Windows.Web.Http` axis to the existing
  CS0104 section (colliding types: HttpClient, HttpMethod, HttpRequestMessage,
  HttpResponseMessage, HttpCompletionOption); resolution = keep `Windows.Web.Http` when
  the code needs its `IHttpFilter`/`HttpBaseProtocolFilter` surface, drop/alias the
  `System.Net.Http` using.
- **Generalizes:** any UWP app doing HTTP via the WinRT stack hits this; WinUI3 desktop
  references `System.Net.Http` by default.
