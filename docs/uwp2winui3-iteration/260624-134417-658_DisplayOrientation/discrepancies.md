# Discrepancies — DisplayOrientation

Score **0/100** · builds ✓ · runs ✓ (but blank) · 1 scenario, 1 fail.

## Scenario 1 — Show and lock orientation — FAIL
- **UWP:** full page (native/current orientation text, auto-rotation prefs, 4 checkboxes, Apply button).
- **WinUI:** blank content frame. Shell + nav item render; scenario frame empty.
- **Evidence:** UIA tree StatusBlock = `Navigation to DisplayOrientation.Scenario1_Orientation failed: Object reference not set to an instance of an object.`
- **Suspected skill gap:** null-static init-order race (App.MainWindow read during MainWindow ctor) — documented but the section falsely claims the smoke launch catches it, and the throw is swallowed by the nested scenario frame. Secondary: `DisplayInformation.AutoRotationPreferences` runtime trap (undetected by inventory).
