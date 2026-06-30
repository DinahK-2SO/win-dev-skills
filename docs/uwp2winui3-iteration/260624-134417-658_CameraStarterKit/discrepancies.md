# Discrepancies — CameraStarterKit (iter 0)

- **Score:** 100/100 · builds=true · runs (disabled-state parity, no camera present)
- **Requirement #0 (PASS):** PreviewControl + PhotoButton + VideoButton all migrated;
  CaptureElement → Image via SoftwareBitmap; buttons correctly disabled.

## Visual discrepancies
- **Disabled button glyphs (minor, cosmetic):** UWP renders disabled Photo/Video glyphs
  visibly; WinUI default disabled styling renders them faintly. UIA confirms both
  controls present and `isEnabled=false`. No functional impact.

## Note
The 100 score depended on the dev-agent **overriding** the skill's incorrect
"defer CaptureElement" guidance. A weaker agent that followed the skill would have
dropped the app's only feature → this is the primary generalizable defect.
