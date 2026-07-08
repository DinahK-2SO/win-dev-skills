# Parity discrepancies — OrientationSensor

**Score 100/100, builds ✅, runs ✅.** No functional or visual discrepancies between the
migrated WinUI 3 app and the original UWP app. All 4 scenarios present with full control
coverage; the Calibration bar (the only hardware-independent interactive behavior) is
verified working.

Measurement limitations (not migration defects): headless session (blank WinUI 3
screenshots — compared via UIA tree instead), no orientation sensor on the box (Enable
correctly disabled, matching UWP), and the UWP CoreWindow not exposing its UIA tree.

> The perfect final score hides two mid-build namespace failures that cost build cycles —
> these are the real improvement targets (see skill-defects.json).
