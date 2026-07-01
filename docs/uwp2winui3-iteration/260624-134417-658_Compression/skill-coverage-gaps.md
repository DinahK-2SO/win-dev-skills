# Skill Coverage Gaps — Compression

## 1. "Never wholesale-overwrite" rule is scoped to `*.xaml` only (under-emphasized)

- **Problem:** On the SEQUENTIAL code-behind `Scenario1.xaml.cs`, the dev-agent overwrote
  the **whole file** with a here-string piped to `Set-Content` (after a `.bak` backup)
  instead of editing in place.
- **Evidence:** `build-events.jsonl` exec #42 (backup) + exec #43 (`@'...'@ | Set-Content
  Scenario1.xaml.cs -Encoding UTF8`); reasoning turns 22–26.
- **Covered at:** SKILL.md → Critical Rules → Fidelity ("never overwrite a whole `*.xaml`
  file …"); Step 1 SEQUENTIAL bullet (line 70).
- **Why missed:** under-emphasized — the prohibition names only `*.xaml`, so a `.cs`
  code-behind reads as fair game, and SEQUENTIAL (filtered-API) files make wholesale
  `Set-Content` the path of least resistance.
- **Proposed improvement:** Widen the existing rule to **all bootstrap-copied source files**
  (incl. `.cs` code-behind/helpers) and add a clause to the SEQUENTIAL bullet warning
  against the `Set-Content`/here-string fallback. Sharpen existing wording; no new topic.
- **Generalizes:** Every migration edits copied `.cs`; filtered-API files are routinely
  SEQUENTIAL; the validator's verbatim-text check is XAML-only, so wholesale `.cs` rewrite
  is unguarded and can silently drop user-visible strings (NotifyUser/status text).
