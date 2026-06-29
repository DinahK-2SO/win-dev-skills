# Lessons — CameraAdvancedCapture (UWP → WinUI 3)

**Outcome:** Build SUCCEEDED, score **100**, full parity. But the success came *despite*
the migration skill, not because of it.

## Headline finding (skill-defect)
The skill tells the agent that `CaptureElement` (live camera preview) has **no migration
path** and must be **deferred**, and explicitly forbids the one replacement that works:

- `unsupported-api-inventory.json` lists `CaptureElement` under **`unsupported`** → the
  pre-triage in `Initialize-UwpMigration.ps1` collapses the whole camera page to
  `Triage label = defer`.
- `MIGRATION-PATTERNS.md` line 53-55 says *"there is no compatible replacement
  (`MediaPlayerElement` covers playback only, not the live camera preview API surface)"*
  and *"Do not try to fake it"*.

The dev-agent **ignored this** and produced the correct, idiomatic WinUI 3 desktop
pattern (MainPage.xaml.cs 355-376):

```csharp
PreviewControl.SetMediaPlayer(_mediaPlayer = new MediaPlayer());
var frameSource = _mediaCapture.FrameSources.Values.FirstOrDefault(...);
_mediaPlayer.Source = MediaSource.CreateFromMediaFrameSource(frameSource);
await _mediaCapture.StartPreviewAsync();
```

`<CaptureElement>` → `<MediaPlayerElement>` in XAML. This built and passed parity. Had a
less capable agent followed the skill, the camera app's **core feature would have been
dropped**. This recurs for **every** UWP camera-preview sample.

## Minor (non-blocking)
- Two `WUI0004` warnings for `DisplayInformation.GetForCurrentView()` and
  `SystemMediaTransportControls.GetForCurrentView()` remained. The GetForCurrentView
  replacement table (PATTERNS.md#getforcurrentview) + the WUI0004 row already cover this
  prominently; left as warnings, build succeeded → **dev-agent-slip**, no skill change.
