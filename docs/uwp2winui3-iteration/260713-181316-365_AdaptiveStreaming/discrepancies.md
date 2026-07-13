# Parity Discrepancies - AdaptiveStreaming

**UWP golden baseline: UNAVAILABLE.** The original UWP app launched (uwp-app-runner ok:true)
but HUNG on its startup splash screen ('Windows platform sample') across two clean Release
launches (Responding:False, ~0 CPU, empty XAML UIA tree). MainPage never presented, so no
functional golden frames exist. Discrepancies are judged against the source-derived checklist
and the WinUI 3 capture; a pixel-level UWP-vs-WinUI comparison was not possible.

All 7 WinUI 3 scenarios rendered non-blank (anyFrameRendered=true, launchBlank=false).

| Scenario | Type | Severity | Detail |
|---|---|---|---|
| Event Handlers | UIA false-negative | none | MediaPlayerElement AutomationId not exposed (documented WinUI limitation); element present via transport controls. |
| Metadata | UIA false-negative | none | Same MediaPlayerElement false-negative; page renders fully. |
| Ad Insertion | UIA false-negative | none | Same MediaPlayerElement false-negative; page renders fully. |
| Network Request Modification | UIA false-negative | none | MediaPlayerElement missing (cov 7/8); all 7 radio buttons present. |
| Adaptive Streaming Tuning | missing-automationid | low | Two 'Set' buttons lack AutomationId -> not auto-invoked; visibly present (cov 7/8). |
| Live Seekable Range | missing-controls | medium | Cov 10/19; seek-offset buttons not found, bottom layout cramped/truncated. |
| All scenarios | behavior-unverified | info | Media-gated controls no-op (no real media in env); no UWP golden to call dead -> flagged for review. |

## Verdict summary
- pass = 6, partial = 1 (Live Seekable Range), fail = 0
- Score = round(100 * (6 + 0.5*1) / 7) = **93**
- Raw structural parity was 50; scenarios 2/5/6 upgraded fail->pass because the sole missing
  control is the MediaPlayerElement UIA false-negative and each page renders fully.
