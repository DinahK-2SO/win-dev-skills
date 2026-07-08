# Dev-Agent Slips (skill already clear → no skill change)

## 1. Secure Stop partial — environment-gated, not a skill gap
- Failure is the absent PlayReady DRM stack (Security Level 0 / Has Hardware DRM False). The
  skill's **Defensive UI** pattern was applied and produced graceful degradation. No skill edit
  can provision DRM hardware; a re-run gets the same partial. **No change.**

## 2. Defensive fallback retrofitted late
- The defensive-UI guidance is already prominent (SKILL.md + MIGRATION-PATTERNS.md#silent-navigation-failures)
  and was ultimately applied. Lateness was caused by the separate MediaElement/SetMediaPlayer
  defect (handled as a skill-defect), not by this guidance. **No change.**
