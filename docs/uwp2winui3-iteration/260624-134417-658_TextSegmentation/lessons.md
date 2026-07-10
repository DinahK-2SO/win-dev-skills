# Lessons — TextSegmentation (iteration 1)

**Outcome:** score 100/100, builds ✔, runs ✔, both scenarios pass with full control coverage. No functional or structural parity discrepancies. The only non-pass signals are environmental (headless screenshot capture) and eval-tool limitations, both out of scope for the migration skill.

## What worked
- **Initialize-UwpMigration.ps1** — clean bootstrap: scaffold + seeded MIGRATION-MAPPING rows + `TODO[migrate-NNN]` markers (log line 206-235).
- **Get-MigrationPattern.ps1** for `windowing` / `threading` — returned the right sections (log lines 1733-1736).
- **Validate-UwpMigration.ps1** — final PASS across all mechanical checks (log line 2907-2922).

## The one real struggle (generalizable)
Turns 14-16 (log lines 1655-1702): the agent needed the **Package.appxmanifest** guidance and reached for it via the documented retrieval tool:
- `Get-MigrationPattern.ps1 -Anchor manifest` → *"Anchor '#manifest' not found"*
- `Get-MigrationPattern.ps1 -Anchor manifest-migration-checklist` → *"Anchor '#manifest-migration-checklist' not found"*
- Fallback: grep `^##` headings to discover section names, then read the file region directly.

**Root cause:** Manifest reconciliation is a mandatory step in *every* UWP→WinUI 3 migration, but its guidance lives as h3 subsections under the `csproj` `<a id>` anchor and has **no anchor of its own**. `Get-MigrationPattern.ps1` resolves only explicit `<a id="...">` tags (not markdown slugs), and SKILL.md Step 4 item 5 links it via a rendered slug (`#manifest-migration-checklist-windowsdesktop--runfulltrust`) that the retrieval script cannot resolve. An agent naturally derives `-Anchor manifest` and fails.

**Preventable by:** adding an `<a id="manifest">` anchor to the manifest section and referencing `-Anchor manifest` from the project-file step and the validator manifest note.

## Environmental (not skill defects)
- Blank WinUI 3 screenshots in the headless session (CopyFromScreen/DirectComposition capture artifact) — a scoring/capture concern, not a migration output defect.
