# Dev-agent slips — AudioCategory (will NOT change skill)

## 1. Mapping Status left at `copied` on first validate
- Validator emitted an explicit itemized FAIL; agent flipped all 13 rows to `done`/`deferred` and
  re-ran to PASS in one pass. Workflow already clearly specified in the mapping header + validator.
- **No skill change** — a capable re-run gets this right.

## 2. `Source not found` → ~40 GitHub web_fetch to rebuild the sample
- Tier-0 **harness/environment race** (local UWP sample tree not materialized at migration start);
  the prompt path was correct. Not a migration-skill topic.
- **No skill change** — recorded under `deferred_to_human` in the improvement plan.
