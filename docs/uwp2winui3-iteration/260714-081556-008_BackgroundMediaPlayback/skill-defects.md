# Skill defects (WILL change skill) — BackgroundMediaPlayback

## 1. SDKTemplate root-namespace reconciliation is absent from the skill
- **Problem:** Windows Universal Samples put the whole app in `namespace SDKTemplate`. The
  scaffold uses the project name. A partial rename leaves an orphaned reference
  (`using SDKTemplate;` at Settings.xaml.cs:15) → **CS0246** → cascading **WMC9999** →
  whole build fails.
- **Evidence:** `migration-score.json` build errors; produced app has 0 `namespace
  SDKTemplate` but 1 leftover `using SDKTemplate;`; session-log turns 33–39 (renaming, then
  timeout).
- **Skill search:** `grep SDKTemplate` across the skill → **0 matches** (absent).
- **Root cause:** bootstrap rewrites only `Windows.UI.Xaml→Microsoft.UI.Xaml`, never the
  root namespace; the reconciliation task is undocumented and unguarded.
- **Fix:** (a) MIGRATION-PATTERNS.md — new CS0246-SDKTemplate pattern with a one-sweep
  rename+verify recipe and the WMC9999 cascade note; (b) SKILL.md Step 1 — mandatory
  root-namespace reconciliation callout; (c) Validate-UwpMigration.ps1 — orphaned-SDKTemplate
  residue check (fails when a `SDKTemplate` reference remains but no `namespace SDKTemplate`
  is declared).
- **Generalizes:** 88/94 corpus samples use `namespace SDKTemplate`; build-breaking and
  recurring across the whole corpus.
