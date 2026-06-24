# Parity Report — AdaptiveStreaming

Generated 2026-06-25T00:54:18.2390904+08:00 by Compare-Parity.ps1.

**Parity score: 50 / 100**  ·  pass=3 partial=1 fail=3  ·  7 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Simplest Adaptive Streaming | PASS | 2/2 | 1/1 live | 01_Simplest_Adaptive_Streaming.png |  |
| 2 | Event Handlers | FAIL | 0/1 | — | 02_Event_Handlers.png | Missing 1/1 control(s): MediaPlayerElement (mediaPlayerElement) |
| 3 | Network Request Modification | PASS | 7/8 | 3/7 live | 03_Network_Request_Modification.png | Missing 1/8 control(s): MediaPlayerElement (mediaPlayerElement) |
| 4 | Adaptive Streaming Tuning | PASS | 7/8 | 0/2 live | 04_Adaptive_Streaming_Tuning.png | Missing 1/8 control(s): MediaPlayerElement (mediaPlayerElement) |
| 5 | Metadata | FAIL | 0/1 | — | 05_Metadata.png | Missing 1/1 control(s): MediaPlayerElement (mediaPlayerElement) |
| 6 | Ad Insertion | FAIL | 0/1 | — | 06_Ad_Insertion.png | Missing 1/1 control(s): MediaPlayerElement (mediaPlayerElement) |
| 7 | Live Seekable Range | PARTIAL | 10/19 | 0/8 live | 07_Live_Seekable_Range.png | Missing 9/19 control(s): MediaPlayerElement (mediaPlayerElement); Button "&lt;&lt;15m"; Button "&lt;&lt;5m"; Button "&lt;&lt;30s"; Button "&lt;&lt;2s"; Button "2s&gt;&gt;"; Button "30s&gt;&gt;"; Button "5m&gt;&gt;" |

## Scenarios needing work

### Scenario 2 — Event Handlers  [FAIL]

- Missing 1/1 control(s): MediaPlayerElement (mediaPlayerElement)
- Controls not found in the WinUI 3 UIA tree:
  - MediaPlayerElement (mediaPlayerElement)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/02_Event_Handlers.png` against the baseline.

### Scenario 5 — Metadata  [FAIL]

- Missing 1/1 control(s): MediaPlayerElement (mediaPlayerElement)
- Controls not found in the WinUI 3 UIA tree:
  - MediaPlayerElement (mediaPlayerElement)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/05_Metadata.png` against the baseline.

### Scenario 6 — Ad Insertion  [FAIL]

- Missing 1/1 control(s): MediaPlayerElement (mediaPlayerElement)
- Controls not found in the WinUI 3 UIA tree:
  - MediaPlayerElement (mediaPlayerElement)
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/06_Ad_Insertion.png` against the baseline.

### Scenario 7 — Live Seekable Range  [PARTIAL]

- Missing 9/19 control(s): MediaPlayerElement (mediaPlayerElement); Button "&lt;&lt;15m"; Button "&lt;&lt;5m"; Button "&lt;&lt;30s"; Button "&lt;&lt;2s"; Button "2s&gt;&gt;"; Button "30s&gt;&gt;"; Button "5m&gt;&gt;"
- Controls not found in the WinUI 3 UIA tree:
  - MediaPlayerElement (mediaPlayerElement)
  - Button "&lt;&lt;15m"
  - Button "&lt;&lt;5m"
  - Button "&lt;&lt;30s"
  - Button "&lt;&lt;2s"
  - Button "2s&gt;&gt;"
  - Button "30s&gt;&gt;"
  - Button "5m&gt;&gt;"
  - Button "15m&gt;&gt;"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/07_Live_Seekable_Range.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
