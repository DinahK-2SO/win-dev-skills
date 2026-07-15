# Skill coverage gaps (WILL change skill) — BackgroundMediaPlayback

_None._ The single root cause (SDKTemplate root-namespace reconciliation) is entirely
**absent** from the skill (0 grep hits), so it is classified as a skill-defect, not a
coverage gap. The related "remove stale `using` after the namespace rewrite" guidance
(PATTERNS.md CS0104) covers UWP-vs-WinUI ambiguity, not the sample-root-namespace rename,
so it does not cover this case.
