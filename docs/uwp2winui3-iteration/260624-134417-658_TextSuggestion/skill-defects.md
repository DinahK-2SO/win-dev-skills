# Skill defects — TextSuggestion (WILL change skill)

## SD1 — Manifest checklist unreachable via the documented fetch tool
- **Problem:** `Get-MigrationPattern.ps1 -Anchor manifest` fails; the Manifest migration
  checklist section has **no `<a id>` anchor**, and SKILL.md L158 links to a markdown slug
  (`#manifest-migration-checklist-windowsdesktop--runfulltrust`) the tool can't resolve.
- **Evidence:** session-log turns 16–18 (lines 1914–1943) — both anchor guesses error out;
  agent abandons the helper and grep's headings.
- **State:** wrong (broken link + missing anchor).
- **Fix:** add `<a id="manifest"></a>` above the heading; point SKILL.md link at `#manifest`.
- **Generalizes:** Every UWP app has a Package.appxmanifest; the background-task-extension
  item prevents a `0x80080204` launch failure that would zero any scenario carrying that
  extension. The most consequential checklist must be reachable by the intended mechanism.
