# Skill defects — CameraStarterKit (iter 0)  → WILL change skill

## D1 — CaptureElement wrongly marked "no migration path / defer"
- **State:** wrong (actively misleading).
- **Wrong text:** PATTERNS.md L55 "there is no compatible replacement … defer"; inventory
  L11 lists `<CaptureElement>` under `unsupported`.
- **Reality (evidence):** trial scored **100/100** by migrating preview to
  `MediaCapture` → `MediaFrameReader` (`CreateFrameReaderAsync`, Bgra8) →
  `SoftwareBitmap.Convert(Bgra8, Premultiplied)` → `SoftwareBitmapSource` on an `<Image>`
  (MainPage.xaml.cs:255-315).
- **Fix:** replace the defer guidance with the supported recipe; reclassify the inventory
  entry from `unsupported` to `adaptable` (anchor `camera-preview`).
- **Generalizes:** every UWP camera sample uses CaptureElement for live preview; the
  MediaCapture+SoftwareBitmapSource pattern is the canonical WinUI 3 replacement for all.
