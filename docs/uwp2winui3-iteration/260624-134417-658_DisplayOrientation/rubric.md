# Rubric — Display orientation (scenario: DisplayOrientation)

Ground truth derived from the running original UWP app and its source.

## Scenario 1 — Show and lock orientation (`Scenario1_Orientation`)

Required controls (5):
- CheckBox "Prefer landscape" (PreferLandscape)
- CheckBox "Prefer portrait" (PreferPortrait)
- CheckBox "Prefer landscape flipped" (PreferLandscapeFlipped)
- CheckBox "Prefer portrait flipped" (PreferPortraitFlipped)
- Button "Apply preferences" (action)

Required output elements:
- Native orientation text (NativeOrientationTextBlock)
- Current orientation text (CurrentOrientationTextBlock)
- Auto-rotation preferences text (AutoRotationPreferencesTextBlock)
- Status block (StatusBlock)

Verdict rules:
- **pass** — page reachable, non-blank, ≥80% controls present, and action controls
  that respond in the UWP golden also respond in WinUI.
- **partial** — reachable, ≥40% coverage, or controls present but the action is dead vs UWP.
- **fail** — blank/unreachable page or <40% coverage.

Behavioral note: In the UWP golden, clicking **Apply preferences** with no checkbox
selected produced no visible text change (auto-rotation preference stays "None"), so
button responsiveness is not a strong differentiator. The primary signal is whether the
scenario page and its controls render at all.
