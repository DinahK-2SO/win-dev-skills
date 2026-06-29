# Discrepancies — CameraFaceDetection (index 0)

**Score 50 · builds ✔ · runs ✔ · 1 feature, partial**

## Requirement
- **#0 CameraFaceDetection — partial.** All controls present + correctly disabled (faithful to the
  camera-less UWP golden), but the page renders visually blank.
  - *Suspected skill gap:* defensive-fallback rule doesn't require the fallback to be visible against
    WinUI 3's default Light background; no pattern warns about hardcoded `Foreground/Fill="White"`.

## Visual discrepancies
1. **Fallback status text** — UWP: no fallback, but visible grey buttons keep the page non-blank.
   WinUI: `StatusText` Visible but `Foreground="White"` on white background → invisible.
2. **Disabled command buttons** — UWP: visible light-grey rounded controls with grey glyphs.
   WinUI: present + disabled with correct AutomationIds, but white glyphs over white page → invisible.

## Summary
Structurally/behaviourally faithful; the sole defect is **white-on-white invisible content** caused
by hardcoded white foreground inherited from the UWP camera overlay meeting WinUI 3's default Light
page background.
