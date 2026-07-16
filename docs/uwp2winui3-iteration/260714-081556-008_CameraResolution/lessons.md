# Lessons — CameraResolution (score 83)

## What worked
- **Bootstrap + mapping** drove a clean file-by-file migration (no hand inventory).
- **Camera preview pattern** (`PATTERNS.md#capture`): `CaptureElement` → `Image` + `SoftwareBitmapSource`, non-blank fallback kept. All 3 scenarios render; `Initialize Camera` actuates.

## The one real gap
- **Scenario 3 "Video Settings" ComboBox** renders but is **absent from the UIA tree** → structural coverage 2/3 → **PARTIAL**.
- **Root cause:** control identity is only `x:Name` + `PlaceholderText`; no `AutomationProperties.AutomationId`. `x:Name` is **not** surfaced in the UIA tree, and placeholder-text matching is unreliable.
- **Telling evidence:** the agent set `AutomationProperties.Name` **only on the camera-preview `<Image>`** — exactly where the skill's capture pattern told it to — and **nowhere else**. The skill never gave a general rule for interactive controls, so the agent never applied one.

## Doc issue
- `PATTERNS.md#capture` says "preserve the name/AutomationProperties so parity checks still match", implying keeping `x:Name` is enough. It isn't — automation matching needs an explicit `AutomationProperties.AutomationId`.

## Prevention
- Tier 3 rule + Tier 1 validator advisory: set `AutomationProperties.AutomationId` on every interactive control.
