# CameraProfile — Discrepancies (reflect step)

**Score 100/100, builds + runs, 0 functional discrepancies.**

All three scenarios (Locate Record Specific Profile, Query Profile for Concurrency,
Query Profile for HDR Support) reproduce the UWP behavior verbatim — 100% control
coverage, identical output text and status-bar messages.

## Cosmetic / expected (not defects)
- Theme: UWP dark → WinUI 3 light.
- Header label: "Universal Windows Platform sample" → "Windows App SDK sample" (correct for WinUI 3).
- UWP hamburger toggle → WinUI 3 nav list always visible.

No missing features. Process friction (not parity defects) is captured in lessons.json:
spurious DEFERRED WARN and SDK-sample shell reconstruction turns.
