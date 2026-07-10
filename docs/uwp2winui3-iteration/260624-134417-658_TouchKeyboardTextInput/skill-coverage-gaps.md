# Skill-coverage-gaps — TouchKeyboardTextInput (index 0)

## 1. No procedure for missing/absent source XAML → WILL change skill (sharpen existing content)
- **Problem:** Skill says "copy .xaml verbatim, never re-author" but has no branch for when the
  authored `.xaml` is missing. Agent improvised (re-authored one page, mixed namespaces) and never
  built.
- **Covered at:** `MIGRATION-PATTERNS.md#xaml` intro; `SKILL.md` Step 1 fidelity rules.
- **Why missed:** under-emphasized (no missing-markup branch).
- **Improvement:** new `#missing-xaml` subsection (failure signature + auto-recovery + author-it
  fallback) and a SKILL Step 1 "check for orphaned code-behind first" pointer to the bootstrap's
  `orphanUnresolvedXaml` report.
- **Generalizes:** any source missing some `.xaml`, or any failed recovery, needs a safe author-it
  procedure.
