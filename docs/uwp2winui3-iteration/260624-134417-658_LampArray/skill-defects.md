# Skill-defects — LampArray (WILL change skill)

## 1. Blank-window guidance is incomplete + over-promises (composition-dependent title-bar chrome)
- **Problem:** The window renders blank white in automated capture **after** the agent
  already applied the documented fix (deleting `<Window.SystemBackdrop>`). The remaining
  cause — `ExtendsContentIntoTitleBar = true` + the `dotnet new winui` `<TitleBar>` control
  + `SetTitleBar` — is not covered anywhere in the skill.
- **Evidence:** migration-score.json `render_status` "blank... only caption buttons
  render"; session-log 3141/4895/4981 (Mica removed, validator `[PASS] No
  <Window.SystemBackdrop>`); UIA ui/01.json shows controls laid out (x=774) yet uniform
  white screenshots.
- **Skill state:** *wrong* — `MIGRATION-PATTERNS.md#system-backdrop-blank` and SKILL.md say
  removing the backdrop "restores reliable rendering", implying it is the sole/sufficient
  cause. Validator Section 9 greps only for `<Window.SystemBackdrop>`.
- **Fix:** Generalize the section to "all scaffold-added composition-dependent window
  chrome" (backdrop **and** extend-into-titlebar/`TitleBar` control), revert to the plain
  default title bar when the UWP original used the standard title bar, soften the
  "one fix restores rendering" language, and extend validator Section 9 to WARN on
  `ExtendsContentIntoTitleBar=true` / `<TitleBar>`.
- **Generalizes:** every `dotnet new winui` scaffold emits both features; every parity
  capture runs headless; most UWP samples use the standard title bar → recurring, not
  scenario-specific.
