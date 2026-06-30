# Lessons — CameraStarterKit (iter 0)

**Outcome:** score 100/100, builds=true, runs (no camera present, both apps disabled-state parity).

## Highest-value findings
1. **Doc error — CaptureElement is migratable, not "defer".** The skill
   (`MIGRATION-PATTERNS.md` CS0246 section + Unsupported list +
   `unsupported-api-inventory.json`) says live camera preview has *no compatible
   replacement* and the file should be deferred. The agent ignored this and built a
   working preview with `MediaCapture` → `MediaFrameReader` (`CreateFrameReaderAsync`)
   → `SoftwareBitmap` (convert to Bgra8/Premultiplied) → `SoftwareBitmapSource` bound
   to `<Image>`. Scored 100. Had the agent followed the skill, the app's only feature
   would have been dropped.
2. **Missing lifecycle note — `Application.Suspending`/`Resuming` removed.** CS1061 at
   TURN 34; UWP pages commonly subscribe to these in `OnNavigatedTo` to pause/resume
   resources (camera, audio, files). The lifecycle section covers `OnLaunched`/activation
   but never says these page-level events are gone. Took ~7 turns to unwind.

## Errors encountered
- `CS1061 Application.Suspending/Resuming` → remove subscriptions + handlers + `_isSuspending` gate.
- Manifest splash/runFullTrust deploy failures → already covered by the manifest checklist.

## Tool notes
- `Initialize-UwpMigration.ps1` + native `dotnet build` worked well.
- `unsupported-api-inventory.json` over-classifies CaptureElement as `unsupported`.
