# Skill Coverage Gaps (WILL change skill) — AdaptiveStreaming

## 1. MediaPlayerElement UIA discoverability caveat is missing from the control-mapping rows
- **Evidence:** score-notes discrepancies.json + migration-score.json — MediaPlayerElement automation peer does not expose AutomationId in UIA (structural 0/1 on scenarios 2/5/6); element renders correctly.
- **Covered at:** MIGRATION-PATTERNS.md 'Controls and Features' (MediaElement/MediaPlayerElement mapping, ~line 377) and 'Controls that need element-level swaps' (~line 584).
- **Why missed:** under-emphasized — rows only cover the element/namespace swap and say properties "carry over"; no warning that AutomationProperties won't surface in UIA.
- **Improvement:** append a one-line Notes caveat to the existing rows — wrap MediaPlayerElement in a named Grid/Border if it must be individually discoverable/named for accessibility. (Sharpen existing content, no new topic.)
- **Generalizes:** media playback is ubiquitous; preserving UIA discoverability of the migrated control is a general accessibility-fidelity concern.
