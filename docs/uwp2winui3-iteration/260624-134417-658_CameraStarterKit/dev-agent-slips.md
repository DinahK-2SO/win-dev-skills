# Dev-agent slips — CameraStarterKit (iter 0)  → will NOT change skill

## S1 — Disabled-button glyphs render faintly (cosmetic)
- Default WinUI disabled control styling vs UWP; controls are functionally correct
  (present, `isEnabled=false`, disabled because no camera). Score stayed 100.
- No skill change: cosmetic-only, no regression; a per-control disabled-visual tweak
  would be scenario-specific over-fitting.
