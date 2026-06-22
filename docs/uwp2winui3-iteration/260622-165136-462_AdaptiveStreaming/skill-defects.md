# Skill defects (skill changed) — AdaptiveStreaming

## 1. Linked shared-content sources not materialized (build-fatal, absent)
- Evidence: CS0234 `SDKTemplate.Logging` missing; CS0246 LogView/MediaPlayerLogger/etc.
- Root cause: bootstrap copies only `-Source`; `$(SharedContentDir)` `<Link>` items are dropped and SDK globbing can't see out-of-cone files.
- Fix: bootstrap section 1b harvests `<Link>`ed includes into the project cone (skip if scaffold already has the file); csproj-section note added.
- Generalizes: every official UWP SDK sample shares code this way.

## 2. Windows.Web.Http vs System.Net.Http ambiguity (CS0104 + CS0535) absent
- Evidence: CS0104 ambiguous HttpClient/HttpRequestMessage/HttpResponseMessage; CS0535 IHttpFilter.SendRequestAsync.
- Root cause: both HTTP stacks in scope on WinUI 3; skill only covered XAML CS0104.
- Fix: new CS0104 Http subsection — keep Windows.Web.Http (qualify/alias) for IHttpFilter/AdaptiveMediaSource; documented CS0535 signature requirement.
- Generalizes: every networking UWP migration hits this.
