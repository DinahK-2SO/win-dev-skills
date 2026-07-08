# Skill Defects (skill absent/wrong → change skill)

## 1. `MediaElement` → `MediaPlayerElement` mapping is wrong (near-rename)
- **Evidence:** session-log.txt TURN 16 — "MediaPlayerElement.MediaPlayer is null until explicitly
  set (unlike UWP's MediaElement)"; agent retrofitted `SetMediaPlayer` + member remap across all
  4 pages after a runtime null-ref (clean build).
- **Wrong text:** MIGRATION-PATTERNS.md said MediaElement properties "carry over with minor renames."
- **Root cause:** hides that `MediaPlayerElement.MediaPlayer` is null until
  `SetMediaPlayer(new MediaPlayer())`, and that `Source`/`Stop()`/`CurrentStateChanged`/
  `ProtectionManager` move onto `MediaPlayer`/`PlaybackSession`.
- **Fix:** corrected both mapping rows + added `#mediaelement-to-mediaplayerelement` subsection
  with the SetMediaPlayer rule and a member-remap table.
- **Generalizes:** recurs in every UWP media/video/DRM sample; fixed WinUI 3 breaking change.
