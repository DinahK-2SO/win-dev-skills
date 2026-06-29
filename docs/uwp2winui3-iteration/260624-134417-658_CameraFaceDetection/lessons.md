# Lessons — CameraFaceDetection (index 0)

**Outcome:** builds ✔, runs ✔, score **50** (1 feature, partial). Parity passed structurally (all
controls present with correct AutomationIds, all disabled exactly like the camera-less UWP golden),
but was capped at **partial** for a visual-fidelity defect.

## The one finding that matters: white-on-white invisible content
- The UWP Face Detection sample uses `Foreground="White"`, white icon `Fill`/`BorderBrush`, and a
  `TranslucentBlackBrush` button background — all designed to sit **over a live camera preview**.
- The agent followed the skill's defensive-UI rule correctly and added a visible fallback
  `StatusText` ("This sample could not initialize on this machine. / No camera device found.").
- **But** it kept `Foreground="White"`. In WinUI 3 the default theme follows the **system (Light)**,
  so `ApplicationPageBackgroundThemeBrush` is **white** and the camera surface is blank/absent →
  the fallback text and the disabled button glyphs render **white-on-white = invisible**.
- The page is therefore visually blank where the UWP golden showed three grey buttons.

## Why it's a skill issue, not a slip
- The defensive-UI rule (SKILL.md) tells the agent to add a *visible* fallback but never says it must
  **contrast with the default Light background** — the agent reasonably reused the source's white
  foreground.
- MIGRATION-PATTERNS.md covers `StaticResource → ThemeResource` but says nothing about **hardcoded
  literal colours** (`Foreground="White"`, white `Fill`) carried from media/camera-overlay pages.

## What worked
- `Initialize-UwpMigration.ps1` namespace rewrite + mapping/deferred seeding.
- Defensive try/catch around camera init (no process crash on a camera-less box).

## Generalizes to
- Every UWP camera/media/video sample (CameraStarterKit family, MediaPlayer overlays) uses
  white-on-translucent-dark overlay chrome, and **all** migrated apps inherit WinUI 3's Light default
  theme — so white-foreground content over an absent media surface is a recurring invisibility trap.
