# Parity Rubric — AdaptiveStreaming (UWP → WinUI 3)

Ground truth: original UWP `AdaptiveStreaming` sample (7 scenarios), launched live
(PID 22496, window "AdaptiveStreaming sample") via `uwp-app-runner`. Candidate: migrated
WinUI 3 app (PID 18876) built with `dotnet build` and launched via `winapp run`.

Each scenario is graded on:
- **Structural coverage** — every UWP control appears in the WinUI UIA tree
  (name / AutomationId / label).
- **Content fidelity** — description text and output elements match the source.
- **Behavioral fidelity** — action controls respond as they do in the UWP golden.

## Verdict rules
- `pass` — reachable, all/nearly-all controls present, content matches, no evidence of
  a dead control relative to the UWP golden.
- `partial` — reachable and recognizable but missing controls, or a control that
  responds in the UWP golden is dead in WinUI.
- `fail` — scenario dropped, blank/unreachable, or <40% of controls present.

## Known measurement artifacts (corrected by inspection, NOT migration defects)
1. `MediaPlayerElement` does not surface `AutomationProperties.AutomationId` through its
   automation peer (documented WinUI limitation). Scenarios whose only checklist control
   is the media player (2, 5, 6) therefore score 0/1 structurally even though the page is
   fully built — presence is confirmed via the transport-controls AppBar + seek slider.
2. The extracted checklist stores seek-button labels HTML-escaped (`&lt;&lt;15m`), so the
   title-driven invoker/matcher misses the real `<<15m` buttons in scenario 7 (undercount
   10/19 and action FAILs). All 19 controls are in fact present.

## Environment limitations (affect capture, not the migration)
- This session has no interactive foreground desktop (`GetForegroundWindow`=0), so mouse
  coordinate input is unavailable → the UWP app could not be navigated per-scenario nor
  its controls actuated (its CoreWindow, hosted by ApplicationFrameHost, is also not
  UIA-walkable). UWP golden = live initial frame only.
- WinUI screenshots capture blank frames (no compositing surface in a headless session),
  so visual grading relies on the fully-populated WinUI UIA tree, which is authoritative
  for structure and text content.
