# Lessons — PlayReady UWP → WinUI 3 (score 88, builds+runs, 3/4 pass)

## Highest-value struggles (grounded in build log)
1. **`MediaElement` → `MediaPlayerElement` is not a rename.** After renaming the type, the
   scenario pages threw `NullReferenceException` at runtime (clean build). Root cause:
   `MediaPlayerElement.MediaPlayer` is **null until `SetMediaPlayer(new MediaPlayer())`** and
   UWP `MediaElement` members (`Source`, `Stop()`, `CurrentStateChanged`, `ProtectionManager`)
   move onto `MediaPlayer`/`PlaybackSession`. The agent had to reverse-engineer this at TURN 16.
   The mapping table said "properties carry over with minor renames" — misleading. → **skill defect**.
2. **`App.xaml` `BasedOn="{StaticResource TitleTextBlockStyle}"` crashes at startup.** Copied from
   the UWP sample's `SharedContent/xaml/Styles.xaml`; those system styles don't resolve at
   Application-resource parse time → `XamlParseException` (0xE0434352). Fixed by inlining the
   setters and dropping `BasedOn`. The startup-crash table didn't list this cause. → **coverage gap**.

## Handled well (no skill change)
- Defensive try/catch on all 4 page constructors (skill already prescribes this) — turned the
  env-gated Secure Stop failure into a graceful fallback (partial, not a crash).
- `CoreApplication.MainView.CoreWindow.Dispatcher` → `DispatcherQueue.TryEnqueue` (already covered).
- Manifest → `Windows.Desktop` + `runFullTrust`; removed Mica/TitleBar to avoid blank capture.

## Environment
- Secure Stop (Scenario 4) is **environment-gated**: no provisioned PlayReady stack (Security
  Level 0 / Has Hardware DRM False). A PlayReady interface throws E_NOINTERFACE at ViewModel
  construction. Not a migration defect; graded partial.
