# Skill defects — DisplayOrientation (WILL change skill)

## D1 — False claim that the smoke launch catches the null-static init-order race
- **State:** wrong. MIGRATION-PATTERNS.md ~line 291: *"Validator catches this race with a 10s smoke launch."*
- **Reality:** only when the throw crashes the root/process. A throw in a **nested** scenario Frame is swallowed by `NavigationFailed` → process alive, page blank, smoke launch green.
- **Evidence:** smoke launch PASS (session-log 1926-1930); blank page + NRE in UIA tree.
- **Fix:** correct the sentence; cross-link `silent-navigation-failures`; require per-scenario render check.
- **Generalizes:** every NavigationView/Frame sample migration.

## D2 — DisplayInformation members beyond GetForCurrentView() undetected & undocumented
- **State:** absent. Inventory only matches `\bGetForCurrentView\s*\(`; `DisplayInformation.AutoRotationPreferences` (get/set), `CurrentOrientation`, `NativeOrientation`, `OrientationChanged` not covered.
- **Evidence:** Scenario1 lines 55/77 use AutoRotationPreferences; no TODO injected. These throw at runtime in desktop.
- **Fix:** (Tier 1) add `\bDisplayInformation\b` adaptable entry → getforcurrentview anchor. (Tier 3) document the runtime trap + replacements (orientation read → Win32 EnumDisplaySettings; auto-rotation lock → no desktop equivalent).
- **Generalizes:** all orientation/rotation/DPI samples.
