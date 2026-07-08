# OCR — Skill Coverage Gaps (WILL change skill — sharpen existing content)

## 1. CaptureElement placeholder swap doesn't remind you to clean the code-behind
- **Evidence:** `session-log.txt` turns 46–47 — `CS1061: 'Border' does not contain a
  definition for 'Source'` (OcrCapturedImage.xaml.cs 415,483). The XAML swap to a Border was
  done correctly, but `PreviewControl.Source = mediaCapture` / `= null` remained.
- **Covered at:** `MIGRATION-PATTERNS.md` "CaptureElement could not be found" (lines 53–75).
- **Why missed:** under-emphasized — the section shows the XAML placeholder but is silent on
  the leftover code-behind that drove the original control.
- **Improvement:** add a sentence: after swapping the hero surface to a Border placeholder,
  also remove/neutralize the code-behind (`.Source`, preview Start/Stop, `.FlowDirection`)
  that referenced the original control.
- **Generalizes:** applies to any deferred hero surface (CaptureElement, InkCanvas,
  MapControl) — all have code-behind that manipulates the original control.
