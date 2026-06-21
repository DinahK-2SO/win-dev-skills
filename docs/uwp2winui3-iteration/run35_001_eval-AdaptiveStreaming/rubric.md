# Feature Rubric — AdaptiveStreaming

## UWP Capture Status
**FAILED**: UWP app crashed at startup in Windows.UI.Xaml.dll (0xc000027b) — native XAML stowed exception (legacy projection incompatibility on current OS). No UWP screenshots captured. Scoring is source-derived only.

## Features (source-derived)

| # | Feature | Description | Priority |
|---|---------|-------------|----------|
| 1 | Scenario Navigation Shell | NavigationView with 7 scenario items + Frame | Critical |
| 2 | Simplest Adaptive Streaming | Load/play HLS/DASH via MediaPlayerElement | High |
| 3 | Event Handlers | Monitor AdaptiveMediaSource events with logging | High |
| 4 | Request Modification | HTTP request interception via IHttpFilter | High |
| 5 | Tuning | Configure bitrate bounds, buffer sizes | Medium |
| 6 | Metadata | Display track/timed metadata | Medium |
| 7 | Ad Insertion | SCTE-35 emsg-based ad insertion | Medium |
| 8 | Live Seekable Range | Live stream seekable range interaction | Medium |
| 9 | PlayReady DRM | MediaProtectionManager for encrypted streams | Medium |
| 10 | Logging Panel | LogView UserControl with level filtering | Low |
| 11 | Content Selector | Dropdown + URI input for content selection | Low |
