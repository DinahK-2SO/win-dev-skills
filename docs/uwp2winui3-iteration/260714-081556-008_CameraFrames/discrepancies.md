# Discrepancies: CameraFrames (UWP → WinUI 3)

Score **75%** (1 pass, 1 partial). Builds ✅ Runs ✅.

| # | Scenario | Status | Item |
|---|----------|--------|------|
| 1 | 1 | pass | All controls/text/status match; "Next Source Group" is a live control. |
| 2 | 2 | partial | Environment-limited (no camera) + ComboBox coverage false negative; no dead/missing controls. |

## Visual discrepancies
- **Duplicate fallback message (scenario 1, low, migration-attributable):** "This sample requires a camera device..." renders twice — a static orange XAML TextBlock plus the dynamic `FallbackMessage` set to the same string. Traces to the skill's Defensive-UI wording. → skill-coverage-gap.
- **Theme (scenario 1, low):** WinUI light vs UWP dark capture — platform default, not a defect.

No missing controls, no dead controls, no behavioural regressions.
