# Skill defects — AudioCategory (WILL change skill)

## 1. MediaElement → MediaPlayerElement documented as a trivial swap (WRONG)
- **Evidence:** migrated `PlaybackControl.xaml.cs` re-architects to `SetMediaPlayer(new MediaPlayer())`,
  `element.MediaPlayer.Play()/Pause()`, `Stop()` = `Pause()` + `PlaybackSession.Position=TimeSpan.Zero`,
  `MediaPlayer.Source = MediaSource.CreateFromStream(...)`, `MediaPlayerAudioCategory`,
  `mediaPlayer.SystemMediaTransportControls`. UWP used those members directly on `MediaElement`.
- **Skill state:** `wrong` — `MIGRATION-PATTERNS.md:362` and `:569` ("Source and transport-control
  properties carry over with minor renames").
- **Root cause:** the `controls` anchor (where a `MediaElement` TODO is routed) understates the
  MediaElement→MediaPlayer split.
- **Fix:** correct both rows + add a focused MediaElement→MediaPlayerElement mapping (SetMediaPlayer,
  playback on `element.MediaPlayer`, Stop pattern, MediaSource.CreateFromStream/Uri, AudioCategory
  enum type change, MediaElementState→MediaPlaybackState).
- **Generalizes:** every UWP media-playback sample needs this exact re-architecture.
