# Skill defects — MIDI (WILL change skill)

## 1. `Get-MigrationPattern.ps1 -Anchor` can't reach anchorless sections and gives no discovery hint
- **Evidence:** session-log turns 18-20 — three failed calls (`manifest`,
  `manifest-migration-checklist`, `appxmanifest`), all "Anchor not found". Turns 21-22:
  recovered only by grepping every heading and opening the file by line range.
- **Skill state:** wrong/limited tooling. Script matches only `<a id="...">`. Many
  high-value sections have no anchor: Manifest migration checklist (line 634),
  appxmanifest reconciliation (602), WUI analyzer warnings (687), PackageReference
  cheat-sheet (587), Namespace Mapping (142), Common build errors (5), Unsupported APIs (122).
- **Root cause:** doc is indexed by `<a id>` only; unanchored sections are unreachable,
  and the not-found error lists no valid anchors — contradicting SKILL.md's "Prefer this
  over opening MIGRATION-PATTERNS.md directly."
- **Proposed fix:** heading-slug fallback matching + list-anchors-and-headings on miss,
  in `scripts/Get-MigrationPattern.ps1`.
- **Generalizes:** manifest/csproj/analyzer sections are needed in almost every packaged
  migration, and near-miss anchor guesses are common; today each dead-ends into the exact
  wholesale-file access the tool exists to prevent.
