# Skill defects — BackgroundMediaPlayback (→ WILL change skill)

## 1. Silent navigation failures are invisible to the process-alive smoke check  *(absent)*
- **Problem:** A content `Page` reached via `Frame.Navigate` that throws in its
  constructor/`Loaded` does **not** crash the app — the content frame goes blank while the process
  stays alive. The skill's runtime verification only checks process-alive, so it reports PASS while
  a scenario is silently dead.
- **Evidence:** `Test-AppLaunch [OK ] status=running` (L6096), `[PASS] Smoke launch — app stayed
  alive` (L6234), `Validate-UwpMigration: PASS` (L6237) — yet migration-score.json marks Background
  Media Playback `fail` (0/5 controls in UIA tree).
- **Skill search:** No `NavigationFailed`/silent-blank coverage anywhere. Runtime-crash guidance
  (`#startup-crashes`, "keep MainWindow's constructor inert") is all scoped to **app startup**, not
  post-startup page navigation.
- **Fix:** New `MIGRATION-PATTERNS.md` subsection on silent navigation failures: wire
  `Frame.NavigationFailed` during bring-up and verify each scenario actually renders (content frame
  non-empty), not just that the app launched. One-line caveat in SKILL.md Step 3 / Section 7.
- **Generalizes:** Every multi-scenario SDK sample (MainPage/NavigationView + Frame + N pages) has
  this exact blind spot; a process-alive smoke check passes green for all of them.
