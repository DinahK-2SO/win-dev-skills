# Dev-Agent Slips — BasicInput (iteration 2)

**Category:** dev-agent-slip → will NOT change skill

## Items

### 1. PointerPoint canvas features scored partial despite correct code

- **Evidence:** pointer-properties-canvas and pointer-properties-mouse-details both partial, but all expected behaviours met=true.
- **Slip type:** random-flake — evaluation tool limitation (static screenshots can't verify interactive popups).
- **Why no skill change:** Code is correct. Partial verdict is a scorer limitation.

### 2. ToggleSwitch features scored partial due to WinUI 3 UIA pattern

- **Evidence:** xaml-manipulations-inertia-toggle and gesture-recognizer-inertia-toggle both partial. UIA exposes ToggleSwitch as Button — WinUI 3 platform behavior.
- **Slip type:** random-flake — platform UIA difference, not migration defect.
- **Why no skill change:** ToggleSwitch was correctly migrated and functions properly. The UIA pattern is a WinUI 3 characteristic no migration guidance can change.
