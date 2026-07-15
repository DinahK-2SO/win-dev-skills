# Lessons — CameraFaceDetection (UWP → WinUI 3)

Build eventually **SUCCEEDED**; independent score **50 (partial)** — camera-hardware-gated on the VM so buttons stayed disabled and behavior could not be positively actuated (no regression vs the identically-gated UWP golden).

## What worked
- **Initialize-UwpMigration.ps1** bootstrapped cleanly (namespace rewrite, mapping/deferred docs, `.uwp-source` preserved).
- **SKILL.md "Defensive UI for device-dependent features"** — agent added a "No camera device found" fallback panel; score note credited it as an improvement (non-blank frame).

## Key struggles / errors
1. **CaptureElement had no recipe.** The skill classifies `<CaptureElement>` as *unsupported → defer* with "no compatible replacement." The agent instead (correctly) migrated it to `<Image>` + `SoftwareBitmapSource` fed by `MediaCapture.GetPreviewFrameAsync` frames (convert to Bgra8/Premultiplied). Score confirmed this is "the correct equivalent." Following the skill literally would have deferred the whole camera page → blank window → feature lost.
2. **FaceDetectionEffect CS0246 (x22).** `FaceDetectionEffect`/`FaceDetectedEventArgs` live in `Windows.Media.Core`, not `Windows.Media.FaceAnalysis` (which only has `FaceDetector`). Agent burned turns theorizing an unprojected namespace / missing NuGet before pivoting to `FaceDetector.DetectFacesAsync` on Gray8 frames.
3. **Invalid theme resource → opaque XAML compiler crash.** `{ThemeResource SystemErrorTextColor}` (a removed UWP key) crashed the markup compiler with `WMC9999: Object reference not set` + `WMC1509` — not a clear "resource not found." Agent first blamed FaceDetectionEffect for the crash, compounding the confusion.

## Preventable by
- A **camera-preview migration recipe** (CaptureElement → Image + SoftwareBitmapSource; FaceDetectionEffect → FaceDetector per frame), reclassifying CaptureElement as *adaptable*.
- A **theme-resource warning**: unknown UWP `System*` keys crash the XAML compiler with `WMC9999` — verify every `{ThemeResource}`/`{StaticResource}` key exists in WinUI 3.
