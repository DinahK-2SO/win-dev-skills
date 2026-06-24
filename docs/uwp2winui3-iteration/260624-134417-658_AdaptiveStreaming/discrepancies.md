# Discrepancies — AdaptiveStreaming (UWP → WinUI 3)

**Bottom line:** No migration defects were found. Every control enumerated for all 7
scenarios is present in the migrated WinUI 3 app's UIA tree, and spot-checked controls
are wired and respond. The `Compare-Parity` structural score of **50/100** is depressed
entirely by measurement artifacts, not by gaps in the migration.

## Migration defects

None.

## Measurement artifacts (why the structural gate under-counts)

1. **MediaPlayerElement AutomationId not projected (scenarios 1–7).**
   A documented WinUI 3 limitation (the parity skill says to wrap it in a Grid/Border).
   `Compare-Parity` reports "MediaPlayerElement not found" for 6 of 7 scenarios, but the
   element is present on every page — its transport controls (Seek, Play, Mute, Aspect
   Ratio, Cast, Time elapsed/remaining) all appear in the UIA tree. Because scenarios
   **2, 5, 6** have the MediaPlayerElement as their *only* enumerated control, this lone
   false-negative drops them to 0/1 = **FAIL** despite being fully migrated.

2. **HTML-escaped seek-button names (scenario 7).**
   The checklist stores `&lt;&lt;15m` etc.; the live WinUI button Name is `<<15m`. The
   comparison misses on the escaping and marks 8 present buttons as "missing", dropping
   scenario 7 to PARTIAL (10/19). All eight buttons exist with the unescaped names.

3. **Ambiguous "Set" button text-invoke (scenarios 4 & 7).**
   Each page has two buttons literally named "Set", so `winapp ui invoke "Set"` is
   ambiguous and reports `[FAIL]`/0 live. Direct invocation by AutomationId confirms they
   work: `DesiredSeekableWindowSizeButton` invoked via InvokePattern, and scenario 4's
   `BitrateDowngradeTriggerRatioText` accepted `set-value 0.7` and read it back.

## Environment limitations (verification, not migration, gaps)

- **UWP golden baseline (scenarios 2–7):** the original UWP launched (`uwp-app-runner
  ok:true`, pid 17368) and its default scenario was screenshotted, but per-scenario
  navigation/actuation was impossible — winapp's UIA walker sees only a top-level Pane
  for the UWP CoreWindow (search returns 0 controls) and the session is non-interactive
  (GDI `CopyFromScreen` fails "handle is invalid"; no foreground; SendInput clicks do not
  register). The UWP capture-manifest shows `navOk:false` for every scenario, so a
  dead-control-vs-UWP behavioral comparison could not be made.
- **WinUI 3 screenshots (all scenarios):** every capture is a blank white frame (identical
  11,273-byte PNGs, including the passing scenario 1). WinUI 3 content renders via a
  DirectX swapchain that PrintWindow cannot capture in this headless/non-foreground
  session. The fully-populated UIA trees confirm the pages are genuinely rendered.

## Functional notes

- **Scenario 7 PlayButton** is reported display-only (no invoke pattern) — expected with
  no media loaded; not a regression.
- **Media playback** itself could not be exercised headlessly (no display surface / media
  decode), so playback-time behaviours were verified by control presence and wiring
  rather than by observing live media output.
