# Skill coverage gaps — MIDI (WILL change skill)

## 1. No authoritative list of fetchable anchors
- **Evidence:** agent guessed three anchor names (turns 18-20) with no canonical list;
  the script comment points at `unsupported-api-inventory.json`, which only lists the
  unsupported-API anchors — not manifest/csproj/analyzer.
- **Covered at:** `Get-MigrationPattern.ps1` .PARAMETER comment; SKILL.md `-Anchor` refs.
- **Why missed:** under-emphasized / incomplete pointer.
- **Improvement:** fully absorbed by the skill-defect fix — the on-miss "available
  anchors + headings" listing gives the agent a live, complete list. No separate edit.
- **Generalizes:** every scenario needing a non-unsupported-API section benefits.
