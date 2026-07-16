# Skill coverage gaps — CameraResolution (WILL change skill)

## 1. Interactive controls migrated with only `x:Name` are invisible to UI Automation
- **Problem:** `x:Name` is not exposed as `AutomationId` in the UIA tree. Controls without `AutomationProperties.AutomationId` can be missed by structural/parity matching and by assistive tech. Scenario 3's "Video Settings" ComboBox rendered but was absent from the captured UIA tree → 2/3 → PARTIAL.
- **Evidence:** `migration-score.json` (feature *Match aspect ratios*, partial, 2/3); produced `Scenario3_AspectRatio.xaml` L37 `<ComboBox Name="VideoSettings" PlaceholderText="Video Settings" .../>` — no `AutomationProperties.AutomationId`. The agent set `AutomationProperties.Name` **only** on the camera-preview `<Image>`, i.e. only where `PATTERNS.md#capture` told it to.
- **Covered at:** `MIGRATION-PATTERNS.md#capture` L62-67 — the sole mention, scoped to the `<Image>`, and subtly misleading.
- **Why missed:** under-emphasized (buried in one API-specific pattern; no general rule).
- **Proposed improvement:** new anchored subsection in *XAML Migration* stating the general `AutomationProperties.AutomationId` rule; correct the `#capture` wording; add a non-fatal validator advisory listing interactive controls lacking an AutomationId.
- **Generalizes:** every migration is UIA-inspected and every app has interactive controls; `x:Name` never surfaces as `AutomationId`, so this recurs everywhere.
