# Skill defects (WILL change skill)

## 1. CaptureElement marked "no compatible replacement / defer" — WRONG
- **Evidence:** MIGRATION-PATTERNS.md L53-55; `unsupported-api-inventory.json` `unsupported` entry. Score note: "software-bitmap-into-Image is the correct equivalent." Migrated `MainPage.xaml.cs` L202-239 implements it and builds/runs.
- **State:** wrong.
- **Root cause:** conflates "no drop-in XAML element" with "no migration path." Live preview → `<Image>` + `SoftwareBitmapSource` fed by `MediaCapture.GetPreviewFrameAsync`/`MediaFrameReader` (Bgra8/Premultiplied).
- **Fix:** reclassify CaptureElement as *adaptable* (anchor `capture`); add a real `capture` section with the recipe.
- **Generalizes:** every UWP camera app; standard documented WinUI 3 pattern.

## 2. FaceDetectionEffect migration absent (CS0246 x22)
- **Evidence:** build-events.jsonl CS0246 loop; final code uses `FaceDetector.DetectFacesAsync`.
- **State:** absent.
- **Root cause:** `FaceDetectionEffect`/`FaceDetectedEventArgs` are in `Windows.Media.Core`, not `Windows.Media.FaceAnalysis`; with an Image preview the natural path is `FaceDetector` on Gray8 frames.
- **Fix:** document the pivot in the new `capture` section.
- **Generalizes:** MediaCapture per-frame analysis effects recur (face/OCR/barcode).
