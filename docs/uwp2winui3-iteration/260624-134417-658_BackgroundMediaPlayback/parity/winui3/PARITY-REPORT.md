# Parity Report — BackgroundMediaPlayback

Generated 2026-06-27T00:16:57.4657594+08:00 by Compare-Parity.ps1.

**Parity score: 50 / 100**  ·  pass=1 partial=0 fail=1  ·  2 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Background Media Playback | FAIL | 0/5 | 0/4 live | 01_Background_Media_Playback.png | Missing 5/5 control(s): MediaPlayerElement (mediaPlayerElement); Button (prevButton); Button (playButton); Button (nextButton); Button "Speed" |
| 2 | Settings | PASS | n/a | — | 02_Settings.png |  |

## Scenarios needing work

### Scenario 1 — Background Media Playback  [FAIL]

- Missing 5/5 control(s): MediaPlayerElement (mediaPlayerElement); Button (prevButton); Button (playButton); Button (nextButton); Button "Speed"
- Controls not found in the WinUI 3 UIA tree:
  - MediaPlayerElement (mediaPlayerElement)
  - Button (prevButton)
  - Button (playButton)
  - Button (nextButton)
  - Button "Speed"
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/01_Background_Media_Playback.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
