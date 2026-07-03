# Parity Rubric — AudioCategory (UWP → WinUI 3)

**Feature:** Audio Category Sample
**Scenarios:** 10 (each a `PlaybackControl`-based page differing only in the applied
`AudioCategory` and its description text).

Every scenario exposes the identical control set from the shared `PlaybackControl`:

| # | Scenario | Required controls | Action to actuate | Expected output |
|---|----------|-------------------|-------------------|-----------------|
| 1 | Movie | Select Audio File, Play, Pause, Stop, Description, Status | Select Audio File | Opens file picker; Status reflects selection/playback |
| 2 | Media | same | Select Audio File | same |
| 3 | Game Chat | same | Select Audio File | same |
| 4 | Speech | same | Select Audio File | same |
| 5 | Communications | same | Select Audio File | same |
| 6 | Alerts | same | Select Audio File | same |
| 7 | Sound Effects | same | Select Audio File | same |
| 8 | Game Effects | same | Select Audio File | same |
| 9 | Game Media | same | Select Audio File | same |
| 10 | Other | same | Select Audio File | same |

## Grading
- **pass** — scenario reachable and ≥80% of baseline controls present in UIA tree,
  and its action control is wired (not dead).
- **partial** — reachable but a control is missing or present-but-dead.
- **fail** — unreachable/blank or <40% coverage.

## Ground-truth notes
- Nav item titles in the original UWP app are prefixed `N) ` (e.g. `1) Movie`).
- The original UWP app **launched successfully** (Release build) and a visual golden
  frame was captured, but its `CoreWindow` UIA tree is opaque on this host, so
  per-scenario title-driven navigation and control actuation could not be driven via
  UI Automation. Per source, all 10 scenarios share the same `PlaybackControl`, so the
  captured golden frame (Scenario 1) is representative of all.
