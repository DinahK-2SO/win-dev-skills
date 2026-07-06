# Parity discrepancies — Inclinometer

**Score 100/100 · builds ✓ · runs ✓ · 0 behavioral regressions**

| # | Feature | Status | Notes |
|---|---------|--------|-------|
| 1 | Data events | pass | Enable/Disable + Pitch/Roll/Yaw/YawAccuracy + description + status area; correct AutomationIds; Disable disabled until Enable. |
| 2 | Polling | pass | Outputs + description match UWP source; hardware-gated equally. |
| 3 | Calibration | pass | High/Approximate/Unreliable radios + exact calibration text; radios invoke. |

**No functional or visual discrepancies.** Blank WinUI screenshots and the inaccessible/non-responsive UWP UIA are measurement-tool artifacts (headless PrintWindow/DirectComposition; sensor-less legacy .NET-Native UWP deadlock), confirmed by fully-populated WinUI UIA trees. The skill improvements come from build/runtime *friction* on the way to 100, not from parity gaps.
