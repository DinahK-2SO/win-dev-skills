# Parity Rubric — BackgroundMediaPlayback (UWP → WinUI 3)

Ground truth: the original UWP C# sample, launched in Release and screenshotted on this
machine (window title "Background Media Playback C# Sample"). Each scenario below is
graded by structural control coverage (UIA tree) **and** visual/behavioral fidelity
against the UWP golden.

## Scenario 1 - Background Media Playback
Expected controls (from UWP source):
- `mediaPlayerElement` (MediaPlayerElement) — video/album-art surface with transport controls
- `prevButton` (Button) — previous track
- `playButton` (Button) — play/pause
- `nextButton` (Button) — next track
- `speedButton` (Button, "Speed") — opens playback-rate flyout
- Track list (Ring 1, Ring 2, Ring 3 Part 1-3) and Audio Category combo box
- Outputs: `currentTrackTitle`, `currentStateTextBlock`, `StatusBlock`

PASS if the MediaPlayerElement and the four transport/speed controls render and respond.

## Scenario 2 - Settings
Expected: settings toggles ("Toast on App Events", "Use Custom Controls"); no scenario-
specific named controls in the source checklist (0 controls / 0 actions).

PASS if the Settings page is reachable and renders its content (non-blank).
