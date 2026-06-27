# Lessons — BasicMediaCasting (UWP → WinUI 3)

**Outcome:** score 100, builds clean, validator PASS. One real build failure occurred
and was recovered in ~2 turns; it points to a generalizable skill gap.

## What worked
- `Initialize-UwpMigration.ps1` scaffolded the project and seeded the mapping table.
- `Get-MigrationPattern.ps1` anchors (pickers/threading/windowing/csproj) were pulled on
  demand; the pickers anchor gave the correct `InitializeWithWindow` pattern for
  `FileOpenPicker`.
- `Validate-UwpMigration.ps1` + `Test-AppLaunch.ps1` closed the loop (0 warnings, smoke
  launch ok).

## The one substantive struggle (generalizable)
The agent copied the UWP source 1:1, then the build failed:

```
XamlCompiler error WMC0001: Unknown type 'MediaElement' ...   (x3 XAML files)
```

It then had to:
- swap `<MediaElement>` → `<MediaPlayerElement>` in 3 XAML files, **and**
- rewrite code-behind: `video.SetSource(stream, type)` → `video.Source =
  MediaSource.CreateFromStream(stream, type)` and `video.GetAsCastingSource()` →
  `video.MediaPlayer.GetAsCastingSource()`.

**Root cause:** `MediaElement` → `MediaPlayerElement` is **not a 1:1 rename**.
`MediaPlayerElement` is a view over an underlying `MediaPlayer`; it has no `SetSource`
and no playback/casting methods. Those move to `element.MediaPlayer`, and `Source`
takes an `IMediaPlaybackSource` (`MediaSource.CreateFromStream/CreateFromUri`).

**Doc error:** the element-swap table in `MIGRATION-PATTERNS.md` describes this as
"Source and transport-control properties carry over with minor renames" — which
understates the code-behind work and is partly wrong (`SetSource` does not carry over).

## Non-issues
- `CastingDevicePicker.Show(Rect, Placement)` compiled without explicit window init; if
  it ever needs it, the existing generic "apply `InitializeWithWindow` to other UI
  surfaces that target a window" line already covers it.
- Casting actuation is hardware-gated and not testable on CI (a measurement limit, not a
  migration fault).
