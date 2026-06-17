# Discrepancies — AdaptiveStreaming (Iteration 1)

## Summary

| Metric | Value |
|--------|-------|
| Score | 0 (timeout) |
| Builds | false (harness timeout) |
| Runs | false (harness timeout) |
| Actual parity achieved | 57.1/100 (4 pass, 0 partial, 3 fail) |

**Note**: The harness recorded `score=0, builds=false, runs=false` because the trial
timed out. The app *did* build and run — the agent achieved 57.1% parity before exhausting
its time budget.

## Parity Breakdown (from last Compare-Parity.ps1 run)

| # | Scenario | Status | Controls Found | Issue |
|---|----------|--------|---------------|-------|
| 1 | Simplest Adaptive Streaming | pass | 2/2 | — |
| 2 | Event Handlers | fail | 0/1 | mediaPlayerElement AutomationId not in UIA |
| 3 | Network Request Modification | pass | 7/8 | — |
| 4 | Adaptive Streaming Tuning | pass | 7/8 | — |
| 5 | Metadata | fail | 0/1 | mediaPlayerElement AutomationId not in UIA |
| 6 | Ad Insertion | fail | 0/1 | mediaPlayerElement AutomationId not in UIA |
| 7 | Live Seekable Range | pass | 18/19 | — |

## Root Cause of Failures

### Scenarios 2, 5, 6: MediaPlayerElement UIA Invisibility
`MediaPlayerElement` does not expose `AutomationProperties.AutomationId` through its
UIA automation peer. The parity checker looks for a control named `mediaPlayerElement`
in the UIA tree and finds nothing.

**Suspected skill gap**: The `Extract-UwpFeatureChecklist.ps1` adds `mediaPlayerElement`
as a required named control for detection. The parity skill documentation does not mention
that `MediaPlayerElement` requires a wrapper element (`Grid`, `Border`) to expose an
AutomationId through UIA. This is a known WinUI 3 / XAML Islands limitation.

**Fix applied (incomplete due to timeout)**: Agent wrapped `MediaPlayerElement` in
`<Grid AutomationProperties.AutomationId="mediaPlayerElement">` for scenarios 3-7 but
timed out before completing the rebuild + re-capture + final Compare-Parity cycle.

### Scenarios 3, 4, 7: Near-pass (7/8, 7/8, 18/19)
These scenarios pass structurally but are missing 1 control match each (likely the same
`mediaPlayerElement` issue). After the Grid-wrapper fix was applied, Scenario 7 achieved
18/19 — the remaining miss may be a similar control-name issue.

## Visual Discrepancies

No visual regressions observed — all 7 scenarios rendered correctly with full navigation,
transport controls, and scenario-specific UI. The failures are purely UIA-detection issues,
not missing features or broken layouts.

## Time Budget Analysis

| Phase | Turns | Notes |
|-------|-------|-------|
| Migration (threading TODOs + MainPage) | 29 | Delegated to sub-agent; completed in ~23 min |
| Parity: subst-drive debugging | 40 | Entirely wasted on environment issue |
| Parity: productive work | 47 | Checklist, capture, compare, fix cycle |
| **Total** | **116** | Timed out during final fix iteration |

Without the subst-drive issue, the agent would have had 40 additional turns — more than
enough to complete the MediaPlayerElement wrapper fix and achieve a passing score.
