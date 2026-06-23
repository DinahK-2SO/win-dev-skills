# Discrepancies — AdaptiveStreaming (UWP -> WinUI 3)

**Verdict: every feature FAIL — score 0.** The migrated WinUI 3 app does **not build**,
so it cannot launch and exposes none of the original scenarios.

## Build errors (dotnet build -c Debug, exit 1, 7 errors)
- LogView.xaml.cs(112,59): CS0103 Colors not in context (missing Microsoft.UI / Windows.UI using)
- Scenario3_RequestModification.xaml.cs(323,69): CS0104 HttpMethod ambiguous (System.Net.Http vs Windows.Web.Http)
- Scenario3_RequestModification.xaml.cs(326,30): CS0104 HttpCompletionOption ambiguous
- Scenario5_Metadata.xaml.cs(554,52): CS0103 CoreDispatcherPriority not in context
- Scenario5_Metadata.xaml.cs(582,56): CS0103 CoreDispatcherPriority not in context
- Scenario5_Metadata.xaml.cs(560,56): CS0165 use of unassigned local currentPosition
- Microsoft.UI.Xaml.Markup.Compiler: WMC9999 Xaml Internal Error (NullReferenceException)

## Per-feature
| # | Feature | Verdict | Note |
|---|---------|---------|------|
| 1 | Simplest Adaptive Streaming | FAIL | candidate does not build/launch |
| 2 | Event Handlers | FAIL | candidate does not build/launch |
| 3 | Network Request Modification | FAIL | candidate does not build/launch |
| 4 | Adaptive Streaming Tuning | FAIL | candidate does not build/launch |
| 5 | Metadata | FAIL | candidate does not build/launch |
| 6 | Ad Insertion | FAIL | candidate does not build/launch |
| 7 | Live Seekable Range | FAIL | candidate does not build/launch |

## UWP ground-truth capture status
Original UWP app launched successfully (Release, pid 29944, window 'AdaptiveStreaming sample')
and was screenshotted (scenario 1 golden saved). The UWP CoreWindow's UIA tree is not
exposed to `winapp` (inspect returns a single Pane), so title-driven navigation to
scenarios 2-7 and per-control actuation could not be performed — a capture-instrument
limitation. It does not affect scoring: the candidate fails to build regardless.
