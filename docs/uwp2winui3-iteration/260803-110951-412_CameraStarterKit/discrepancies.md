# Discrepancies — CameraStarterKit

Score **100/100**, builds ✓, runs ✓.

- **Camera preview** (cosmetic, not a gap): UWP `CaptureElement 'PreviewControl'` → WinUI `Image 'PreviewImage'` / AutomationName "Camera preview". Role-equivalent; parity script literal-name miss only.
- **Photo/Video buttons**: disabled in both UWP golden and WinUI candidate (no camera on host) → parity, not a regression.

**No feature-level skill gaps.** The improvement lever is the migration *process*: the `Get-MigrationPattern.ps1` anchor-discovery friction (see skill-defects).
