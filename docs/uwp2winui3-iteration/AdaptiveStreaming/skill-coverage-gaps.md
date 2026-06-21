# Skill Coverage Gaps: AdaptiveStreaming

**Category:** skill-coverage-gap → WILL change skill

## 1. Shell conversion table says ListView but SDK samples use ListBox

**Problem:** The shell conversion table in SKILL.md says `MainPage + ListView + Frame (SDK-sample idiom) → NavigationView + Frame`, but UWP SDK samples actually use `ListBox`, not `ListView`. The agent didn't match `ListBox` to `ListView`, so it preserved the SplitView+ListBox structure which fails to render in WinUI 3.

**Covered at:** SKILL.md § Shell conversion table, line 96

**Why missed:** Pattern match too narrow — says `ListView` when the actual control is `ListBox`

**Proposed improvement:** Broaden to `MainPage + ListView/ListBox + Frame`

**Generalizes:** All UWP SDK samples use `ListBox` for scenario navigation — this affects every migration.
