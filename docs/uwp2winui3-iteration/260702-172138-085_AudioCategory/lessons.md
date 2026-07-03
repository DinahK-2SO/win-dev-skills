# Lessons — AudioCategory (index 0)

Score **100/100**, builds ✅, runs ✅. The migration succeeded; the value here is in the
**dev-agent struggles** and one **misleading doc** mined from the build log.

## Helpful tools
- **Get-MigrationPattern.ps1** (25x) — anchored patterns (windowing, getforcurrentview, controls).
- **Initialize-UwpMigration.ps1** — seeded the 13-row MIGRATION-MAPPING + namespace rewrites.
- **Validate-UwpMigration.ps1** — caught 13 rows stuck at `Status=copied`; 0-warning build gate.
- **Test-AppLaunch.ps1** — runtime smoke gate (app stayed alive).

## Doc error (→ skill change)
- `MIGRATION-PATTERNS.md` presents **MediaElement → MediaPlayerElement** as a namespace/element
  swap with "minor renames". **Wrong.** `MediaPlayerElement` has no `Play/Pause/Stop/SetSource/
  AudioCategory/AutoPlay/CurrentState`. Playback moves onto a `Windows.Media.Playback.MediaPlayer`
  (`element.SetMediaPlayer(new MediaPlayer())`): `MediaPlayer.Play()/Pause()`, `Stop()` =
  `Pause()` + `PlaybackSession.Position = TimeSpan.Zero`, `MediaPlayer.Source =
  MediaSource.CreateFromStream/Uri(...)`, `AudioCategory` enum →
  `MediaPlayerAudioCategory`, `MediaElementState` → `MediaPlaybackState`.

## Special APIs
- **SystemMediaTransportControls.GetForCurrentView()** → `mediaPlayer.SystemMediaTransportControls`
  (no per-view singleton on desktop). **Absent** from the GetForCurrentView() table.
- **AudioCategory** enum namespace/type change (see above).
- **MediaElement.AudioDeviceType** — no MediaPlayer equivalent; unused here so safely dropped.

## Errors encountered
- `Initialize-UwpMigration.ps1: Source not found` on the correct prompt path → **harness race**
  (local sample tree not materialized at start). Agent recovered by fetching the sample from
  GitHub (~40 `web_fetch`).
- `Validate-UwpMigration.ps1 FAIL: 13 rows Status=copied` → flipped to `done`/`deferred`, re-ran → PASS.

## Env issue → deferred to human
- Local UWP source missing at migration start; agent burned ~40 web_fetch reconstructing it.
  Tier-0 harness fix (ensure source exists before agent starts) — out of skill scope.
