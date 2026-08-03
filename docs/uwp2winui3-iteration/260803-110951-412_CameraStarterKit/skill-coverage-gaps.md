# Skill coverage gaps — CameraStarterKit

## 1. WMC0001→#capture cross-reference not reached first (grey-zone)
- Agent guessed anchors instead of fetching the "Common build errors" entry that maps `WMC0001 CaptureElement` → `#capture`.
- Already covered at the `### CS0246 / WMC0001` entry (links to `#capture`).
- **Resolution:** subsumed by the Tier-1 script fix — heading-text substring matching lets `-Anchor CaptureElement` or `-Anchor 'camera preview'` resolve directly. No new prose (prose can be ignored; tooling can't).
- Generalizes: agents key off natural-language error/feature terms, not terse ids.
