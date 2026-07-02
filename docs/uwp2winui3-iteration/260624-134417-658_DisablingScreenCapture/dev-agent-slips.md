# Dev-agent slips — DisablingScreenCapture (will NOT change skill)

## 1. AppCapture.GetForCurrentView() adaptation
- **Evidence:** Agent wrapped `AppCapture.GetForCurrentView()` in try/catch and kept static `AppCapture.SetAllowedAsync(bool)` (session-log ~1803, summary ~2951). Built and scored pass.
- **Covered clearly at:** `## GetForCurrentView() Replacements` (`<a id="getforcurrentview">`) — states none of the GetForCurrentView singletons work in WinUI 3 desktop; the generic `GetForCurrentView()` inventory pattern already routes here.
- **Slip type:** one-off-mistake (handled correctly).
- **Why no skill change:** Already prominently covered; an AppCapture-specific note would be scenario-specific bloat.
