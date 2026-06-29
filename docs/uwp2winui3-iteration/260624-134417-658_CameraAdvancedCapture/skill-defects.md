# Skill defects — CameraAdvancedCapture (WILL change skill)

## 1. CaptureElement wrongly classified as unsupported / "no migration path"
- **Evidence:** `unsupported-api-inventory.json` L11 (`CaptureElement` under `unsupported`)
  → `Initialize-UwpMigration.ps1` L325-332 forces the camera page to `defer`.
  `MIGRATION-PATTERNS.md` L53-55 says *"no compatible replacement"* and forbids
  `MediaPlayerElement`. Yet the dev-agent migrated it successfully (score **100**, full
  parity) using `MediaPlayerElement.SetMediaPlayer` + `MediaSource.CreateFromMediaFrameSource`
  + `MediaCapture.StartPreviewAsync` (MainPage.xaml.cs 355-376).
- **Skill state:** WRONG (active mis-guidance that would drop the app's core feature).
- **Fix:**
  1. Inventory: `CaptureElement` → `adaptable` (anchor `capture`, tier `safe`).
  2. PATTERNS.md L53-55: replace the "no replacement / defer" note with a pointer to a
     new `#capture` section documenting the live-preview pattern.
  3. Element-swap table: add `<CaptureElement>` → `<MediaPlayerElement>`.
- **Generalizes:** Every UWP live-camera-preview sample uses `CaptureElement`; this is the
  reusable WinUI 3 desktop replacement.
