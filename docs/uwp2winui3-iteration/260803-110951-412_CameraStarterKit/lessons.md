# Lessons — CameraStarterKit (UWP→WinUI 3)

**Outcome:** Build succeeded (warnings only); parity score **100/100**. All three controls (preview, PhotoButton, VideoButton) present and role-equivalent. No behavioral regression.

## What worked
- `MIGRATION-PATTERNS.md#capture` correctly directed `CaptureElement` → `<Image>` + `SoftwareBitmapSource` frame pump, and told the agent **not to defer** the camera page. Followed verbatim → pass.

## Main friction (generalizable)
- **`Get-MigrationPattern.ps1` anchor discovery is opaque.** On the `WMC0001: CaptureElement` error the agent guessed `-Anchor media` and `-Anchor camera-preview` (both failed with a bare "not found"), then had to `Select-String '^## '` the headings and grep `CaptureElement` before discovering the real anchor is `capture` (turns 30–34, ~3 wasted turns).
  - Root cause: the helper matches only exact `<a id>` anchors, gives **no list of valid anchors on failure**, and does **no heading-text matching**. The anchor `capture` is not guessable from the UWP term "camera preview".
  - Secondary: several `##` sections have **no `<a id>` at all**, so they're unreachable by the helper — forcing a full-file open the script's own docstring warns against (content-safety filter).
  - Preventable by: on not-found, print all anchors + heading text and accept case-insensitive substring matches.

## One-off (not a skill issue)
- `MainPage.xaml.cs` got duplicated/corrupted after an edit; agent rewrote the file cleanly and recovered. A dev-agent edit slip, not a skill gap.
