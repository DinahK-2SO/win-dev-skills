# Lessons — BasicMediaCasting (UWP → WinUI 3)

**Outcome:** score 100, all 3 features pass, clean build (0 errors). No blocking struggles — but the
dev-agent had to independently derive two non-trivial conversions the skill documents poorly. Both
recur across other media/casting UWP samples, so both are worth hardening in the skill.

## What worked
- `Initialize-UwpMigration.ps1` namespace/manifest retarget → clean build.
- `Validate-UwpMigration.ps1` smoke launch confirmed the app stayed alive.

## Doc error
- **MIGRATION-PATTERNS.md line 615** says `MediaElement → MediaPlayerElement`: *"Source and
  transport-control properties carry over with minor renames."* This is misleading:
  - `MediaPlayerElement.Source` is `IMediaPlaybackSource`, **not** `Uri`.
  - `MediaElement.SetSource(stream, contentType)` has **no** equivalent → use
    `MediaSource.CreateFromStream(stream, contentType)` / `MediaSource.CreateFromUri(uri)`.
  - Playback + casting APIs (`Play/Pause/GetAsCastingSource`) move to the underlying
    `MediaPlayer` via `MediaPlayerElement.MediaPlayer`.

## Special APIs the agent handled by hand
- `video.SetSource(stream, type)` → `video.Source = MediaSource.CreateFromStream(stream, type)`
- `video.GetAsCastingSource()` → `video.MediaPlayer.GetAsCastingSource()`
- `CastingDevicePicker` needs `InitializeWithWindow.Initialize(picker, hwnd)` before `.Show(...)`
  — same HWND rule as file pickers, but not listed in the picker section.

## Dev-agent struggles (both resolved first-try from model knowledge, no web research)
1. Media Source/SetSource/MediaPlayer conversion — preventable by documenting it.
2. CastingDevicePicker HWND init — preventable by naming it in the InitializeWithWindow list.
