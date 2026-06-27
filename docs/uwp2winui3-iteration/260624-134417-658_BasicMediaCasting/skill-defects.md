# Skill defects — BasicMediaCasting (WILL change skill)

## 1. `MediaElement → MediaPlayerElement` is not a 1:1 swap (note is misleading)
- **Evidence:** `session-log.txt` L3132-3134 — `WMC0001 Unknown type 'MediaElement'` (x3);
  L3157-3195 — `SetSource` → `MediaSource.CreateFromStream`, `GetAsCastingSource()` →
  `MediaPlayer.GetAsCastingSource()`. Generated `Scenario2_CastingDevicePicker.xaml.cs`
  L72/L102.
- **Skill state:** wrong. `MIGRATION-PATTERNS.md` element-swap table (~L623) says
  *"Source and transport-control properties carry over with minor renames"* — but
  `SetSource` and the playback/casting methods are **not** on `MediaPlayerElement`.
- **Root cause:** `MediaPlayerElement` is a view over an underlying `MediaPlayer`.
  `Source` takes an `IMediaPlaybackSource`; `Play/Pause/Stop/GetAsCastingSource/
  PlaybackSession` live on `element.MediaPlayer`.
- **Fix:** correct the note + add a focused `#media-element` subsection with the
  code-behind delegation mapping, and point the Controls table row at it.
- **Generalizes:** every UWP media/casting app uses these imperative APIs; the
  "XAML compiles, code-behind breaks" failure recurs across all of them.
