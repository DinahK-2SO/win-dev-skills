# Discrepancies — AdaptiveStreaming

Score 0/7. App does not build, so no WinUI capture exists to compare against the UWP golden.

| # | Feature | Status | Suspected skill gap |
|---|---------|--------|---------------------|
| 1 | Simplest Adaptive Streaming | fail | Linked SharedContent harvest gap (LogView/logger types missing) |
| 2 | Event Handlers | fail | Harvest gap (MediaPlayer/MediaSource/MediaPlaybackItem loggers) |
| 3 | Network Request Modification | fail | No CS0104 Windows.Web.Http pattern; CS0535 IHttpFilter undocumented |
| 4 | Adaptive Streaming Tuning | fail | Harvest gap |
| 5 | Metadata | fail | Harvest gap + Http ambiguity |
| 6 | Ad Insertion | fail | Harvest gap + Http ambiguity |
| 7 | Live Seekable Range | fail | Harvest gap (MediaPlayerLogger) |

All failures trace to the build never going green.
