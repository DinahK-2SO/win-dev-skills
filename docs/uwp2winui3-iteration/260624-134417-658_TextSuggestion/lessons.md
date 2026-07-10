# Lessons — TextSuggestion (UWP → WinUI 3)

**Outcome:** score 100, builds ✅, runs ✅, 3/3 features pass. A clean migration; the
only real friction was **tooling discoverability**, not a functional defect.

## Key struggle (high-value)
- **Manifest pattern was unreachable via the documented fetch tool.** At turns 16–18 the
  agent ran `Get-MigrationPattern.ps1 -Anchor manifest-migration-checklist` and
  `-Anchor manifest`. Both failed (`Anchor '#…' not found`). The script only resolves
  explicit `<a id="…">` anchors, and the manifest checklist has none. SKILL.md line 158
  even links to `#manifest-migration-checklist-windowsdesktop--runfulltrust` — a markdown
  slug the tool can't consume.
- The not-found error printed **no list of valid anchors**, so the agent couldn't
  self-correct; it abandoned the helper, grep'd `## ` headings, and hand-wrote the
  manifest edits. This app had no background-task extension, so it still launched — but a
  scenario *with* a `windows.backgroundTasks` extension would silently fail to launch
  (0x80080204) and zero the score, exactly the case the manifest checklist exists to fix.

## Doc error
- SKILL.md → Manifest checklist link uses a slug (`#manifest-…-runfulltrust`) that
  `Get-MigrationPattern.ps1` cannot resolve; the section has no `<a id>` anchor.

## Benign
- Nullable warnings (CS86xx) across ported `.xaml.cs` / `SampleConfiguration.cs` — build
  still succeeded.
- Blank WinUI screenshots + UWP UIA limitation are **scorer-side** artifacts, not
  migration concerns.
