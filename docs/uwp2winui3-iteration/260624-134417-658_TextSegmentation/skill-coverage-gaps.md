# Skill coverage gaps (present but unclear/not prominent → change skill)

## 1. Manifest migration guidance is not retrievable via the documented anchor mechanism
- **Problem:** `Get-MigrationPattern.ps1 -Anchor manifest` and `-Anchor manifest-migration-checklist` both fail; the agent had to grep headings to find the manifest guidance.
- **Evidence:** session-log.txt lines 1662-1702 (turns 14-16). Retrieval script only resolves `<a id>` tags (Get-MigrationPattern.ps1 lines 42-55).
- **Covered at:** MIGRATION-PATTERNS.md h3 subsections at lines 679 and 711, buried under the `<a id="csproj">` anchor (line 651). SKILL.md line 158 links them via a non-fetchable markdown slug.
- **Why missed:** not prominent / no dedicated anchor; the sole cross-link points at a slug the retrieval script can't resolve.
- **Proposed improvement:** add `<a id="manifest">` before the manifest heading; reference `-Anchor manifest` from SKILL.md Step 2 and fix the Step 4 item 5 cross-link to `#manifest`.
- **Generalizes:** Package.appxmanifest reconciliation is mandatory in *every* UWP→WinUI 3 migration; a `manifest` anchor prevents repeated dead-end guesses across all scenarios.
