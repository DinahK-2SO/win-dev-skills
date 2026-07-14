# Discrepancies — AdaptiveStreaming (my classification)

Score 100 (7/7 pass), builds, runs, zero behavioral regressions. Structural gate 50/100 = measurement artifacts.

| Req | Feature | Status | Suspected skill gap |
|-----|---------|--------|---------------------|
| 1 | Simplest Adaptive Streaming | pass | — |
| 2 | Event Handlers | pass | MediaPlayerElement not in UIA tree (automation-peer artifact) |
| 3 | Network Request Modification | pass | — |
| 4 | Adaptive Streaming Tuning | pass | — |
| 5 | Metadata | pass | MediaPlayerElement UIA-discoverability |
| 6 | Ad Insertion | pass | MediaPlayerElement UIA-discoverability |
| 7 | Live Seekable Range | pass | Unnamed seek/transport buttons lack AutomationId |

## Visual discrepancies
- **Scenarios 2/5/6:** MediaPlayerElement renders (transport bar visible) but its automation peer does not project `AutomationId`, so the structural checker sees 0/1.
- **Chrome:** UWP sample header/footer branding omitted (not a scored feature).

## Summary
Full functional + behavioral parity. Only reusable engineering lesson is the CS0104 `Windows.Web.Http` vs `System.Net.Http` build ambiguity (undocumented in the skill). The MediaPlayerElement UIA gap is a secondary, generalizable accessibility-fidelity note.
