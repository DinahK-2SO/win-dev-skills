# Discrepancies: AdaptiveStreaming

**Score:** 20.0% | **Builds:** ✅ | **Runs:** ✅

## Visual discrepancies
- **SplitView navigation pane**: UWP shows ListBox with 7 scenarios; WinUI 3 shows nothing — pane doesn't render

## Missing features
- Scenario navigation (SplitView pane with ListBox)
- Scenarios 2-7 unreachable
- ContentSelector control (only in scenarios 2-7)
- Status bar at bottom

## Summary
App builds and launches. Scenario 1 works (MediaPlayerElement + Load button). But the SplitView navigation pane fails to render, blocking access to all other scenarios.
