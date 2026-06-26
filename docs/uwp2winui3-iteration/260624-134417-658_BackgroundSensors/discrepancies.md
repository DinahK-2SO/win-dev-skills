# Discrepancies — BackgroundSensors (improve trial copy)

**Result: full parity (score 100). No app-level discrepancies.**

| Requirement | Status | Notes |
|---|---|---|
| Accelerometer DeviceUse (Enable, Disable, Sample count, Status) | pass | 2/2 controls; verbatim text; hardware-gated identically to UWP (`No accelerometer found`). |

- No visual or behavioral regressions.
- The blank WinUI client-area screenshot is a known eval-side `PrintWindow` capture limitation
  (UIA tree confirms full render). Out of scope for the migration skill.
- Only migration-skill signal: a build cycle lost to CS0579 duplicate `AssemblyInfo` attributes —
  generalizable, now fixed in the skill.
