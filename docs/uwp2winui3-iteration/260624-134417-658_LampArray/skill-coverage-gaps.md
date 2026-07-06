# Skill-coverage-gaps — LampArray (WILL change skill)

## 1. "Confirm the scenario renders" is ambiguous — UIA-present != pixels-painted
- **Problem:** The skill says to confirm each scenario "actually renders (controls present,
  not an empty page)", but the agent's only headless signal is the UIA tree, which was
  fully populated even though the window painted pure white. The guidance was technically
  satisfied while the app was blank.
- **Covered at:** SKILL.md ~132 / ~160 ("Verify each scenario renders yourself");
  MIGRATION-PATTERNS.md#silent-navigation-failures.
- **Why missed:** ambiguous — "controls present" reads as satisfiable by the UIA tree.
- **Improvement:** Clarify that a fully populated UIA/visual tree does NOT prove the page
  paints (composition-dependent chrome can blank a fully-laid-out window), cross-link the
  broadened blank-window section, and steer toward proactively removing composition-
  dependent scaffold chrome instead of relying on a visual check that is unavailable headless.
- **Generalizes:** UIA-present != painted applies to any migrated app in the automated
  capture environment.
