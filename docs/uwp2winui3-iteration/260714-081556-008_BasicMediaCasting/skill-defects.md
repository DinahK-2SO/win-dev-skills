# Skill defects — BasicMediaCasting (WILL change skill)

## 1. MediaElement → MediaPlayerElement is not a trivial rename
- **State:** wrong (misleading).
- **Wrong text:** MIGRATION-PATTERNS.md line 615 — *"Source and transport-control properties carry
  over with minor renames."* (and the bare mapping row at line 396).
- **Reality:**
  - `MediaPlayerElement.Source` is `IMediaPlaybackSource` (not `Uri`) → use
    `MediaSource.CreateFromUri(uri)` / `MediaSource.CreateFromStream(stream, contentType)`.
  - `MediaElement.SetSource(stream, contentType)` has **no** equivalent.
  - Playback + casting (`Play/Pause/GetAsCastingSource`) live on `MediaPlayerElement.MediaPlayer`.
- **Evidence:** UWP source `video.SetSource(...)` / `video.GetAsCastingSource()` (session-log
  360/497/529/623/724) → migrated `video.Source = MediaSource.CreateFromStream(...)`
  (Scenario1 line 41) and `video.MediaPlayer.GetAsCastingSource()` (Scenario2 line 74).
- **Fix:** expand the MediaElement guidance with the Source / SetSource / `.MediaPlayer` conversion.
- **Generalizes:** every UWP media-playback app hits this exact three-part change.
