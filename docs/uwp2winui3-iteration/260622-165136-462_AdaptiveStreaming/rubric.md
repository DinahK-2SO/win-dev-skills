# Parity Rubric — AdaptiveStreaming

Ground truth: original UWP app **launched successfully** (Release, SDK 10.0.26100.0,
PID 15300, window title "AdaptiveStreaming sample"). 7 scenarios extracted from source.

| # | Scenario | Controls | Actions |
|---|----------|----------|---------|
| 1 | Simplest Adaptive Streaming | 2 | 1 |
| 2 | Event Handlers | 1 | 0 |
| 3 | Network Request Modification | 8 | 7 |
| 4 | Adaptive Streaming Tuning | 8 | 2 |
| 5 | Metadata | 1 | 0 |
| 6 | Ad Insertion | 1 | 0 |
| 7 | Live Seekable Range | 19 | 15 |

A scenario passes only if the migrated WinUI 3 app renders it and its controls are
present and behave as the UWP golden. Because the migrated app does not build, no
WinUI capture is possible and every scenario fails.
