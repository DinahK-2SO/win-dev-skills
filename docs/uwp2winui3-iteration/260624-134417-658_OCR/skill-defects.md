# OCR — Skill Defects (WILL change skill)

## 1. Removed UWP app-lifecycle events (`Application.Suspending`/`Resuming`) — absent
- **Evidence:** `session-log.txt` turns 42–45 — `CS1061: 'Application' does not contain a
  definition for 'Suspending' ... 'Resuming'` (OcrCapturedImage.xaml.cs 83,84,109,110). The
  agent had to discover this at build time and manually strip the subscriptions/handlers.
- **Skill search:** grepped `Suspending|Resuming|EnteredBackground|LeavingBackground` across
  the whole `winui-uwp-migration` skill → **no matches** (docs, scripts, or inventory).
- **State:** absent. `PATTERNS.md#lifecycle` covers only `OnLaunched`/activation.
- **Root cause:** these UWP lifecycle events don't exist on `Microsoft.UI.Xaml.Application`
  in WinUI 3 desktop; the mechanical namespace rewrite leaves compiling-then-failing code.
- **Fix:** (Tier 1) add an `adaptable` inventory entry (anchor `lifecycle`) so a
  `TODO[migrate-NNN]` is injected at each subscription site; (Tier 3) extend the
  `#lifecycle` section with the removal + replacement guidance.
- **Generalizes:** almost every UWP app cleans up cameras/media/sensors or saves state on
  suspend, so this CS1061 recurs across scenarios.
