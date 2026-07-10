# Skill coverage gaps — TextSuggestion (WILL change skill)

## CG1 — Get-MigrationPattern.ps1 anchor miss is a dead end
- **Problem:** On a wrong anchor guess the script prints only "Anchor '#X' not found" — no
  valid-anchor list, no substring fallback — so the agent can't self-correct and abandons
  the tool (only 2 invocations all migration, both failed).
- **Evidence:** session-log turns 16–18.
- **Covered at:** the not-found branch (lines 52–55) + .SYNOPSIS pointing at
  unsupported-api-inventory.json, which actually omits many real anchors.
- **Why missed:** under-emphasized; valid anchors are never surfaced on failure.
- **Improvement:** on miss, list the real `<a id>` anchors from the patterns file and
  auto-resolve a unique case-insensitive substring match before failing.
- **Generalizes:** every agent guesses anchors; substring-tolerant self-listing makes any
  near-miss a one-turn recovery across all scenarios.
