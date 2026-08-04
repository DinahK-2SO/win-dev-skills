# Rubric — DisplayOrientation

## Feature: Display orientation

### Scenario 1 — Show and lock orientation
**Controls (5):** Prefer landscape, Prefer portrait, Prefer landscape flipped,
Prefer portrait flipped (CheckBoxes) + Apply preferences (Button).

**Actions:** Click "Apply preferences" → applies the checked auto-rotation
preferences.

**Expected outputs (the core purpose of the sample):**
- Native orientation: a real value (UWP golden shows **Landscape**)
- Current orientation: a real value (UWP golden shows **Landscape**)
- Auto-rotation preferences: reflects applied preference (UWP golden shows **None**)

A migration that renders these outputs as `N/A` or an exception string has **not**
reproduced the feature, even if all controls are structurally present.
