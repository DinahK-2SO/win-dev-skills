# Dev Agent Slips — AdaptiveStreaming (iteration 1)

## 1. MIGRATION-MAPPING.md rows left at Status=copied

- **Category**: dev-agent-slip (read-but-ignored)
- **Evidence**: Validator FAIL at session-log.txt L8341-8344. Agent bulk-updated all 121 rows to `done` after the fact.
- **Covered clearly at**: SKILL.md Step 1 (line 90): "Flip Status from copied → done as each row is finished." Also Step 4 (line 154): Validator checks for rows stuck at `copied`.
- **Slip type**: read-but-ignored — the agent knew the rule but deferred the bookkeeping.
- **Why no skill change**: The instruction is explicit and prominent. The agent fixed it immediately when the validator caught it. A re-run would likely get this right.
