# Skill coverage gaps — CameraFaceDetection (index 0)  → WILL change skill

## 1. "Visible fallback" doesn't say *contrast-visible against the default Light background*
- **Evidence:** agent followed the rule (added a Visible StatusText fallback), but `discrepancies.json`
  `blank-fallback-text`: it "renders white-on-white and is invisible". Verdict **partial**.
- **Covered at:** SKILL.md `### Defensive UI for init-heavy and device-dependent pages`, the **Rule:**
  paragraph (lines 221-224) — tells the agent to swap content for a "visible fallback" TextBlock.
- **Why missed:** under-emphasized — "visible" was read as `Visibility=Visible`, not "actually seen".
- **Proposed improvement:** add one clause: the fallback must use a theme-aware foreground
  (`{ThemeResource TextFillColorPrimaryBrush}` / default app foreground), **not** a hardcoded/inherited
  `Foreground="White"`, so it contrasts with WinUI 3's default Light page background.
- **Generalizes:** the fallback fires on the device-absent path common to all headless validation runs;
  inheriting white overlay foreground makes it invisible across every such scenario.
