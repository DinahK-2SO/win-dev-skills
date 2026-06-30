# Lessons — Compass (iteration 1)

## Verdict: VOID TRIAL — no skill evidence

The migration agent **never ran**. Its first model call returned **HTTP 401
"authentication failed"** (`model.call_failure`, `source: top_level`), and the session
ended immediately with `session.error` `errorType: authorization`
("Authorization error, you may need to run /login").

### Evidence (from `000_Compass/session-logs-dir/build-events.jsonl`)
- 13 events total; sequence ends: `assistant.turn_start` → `model.call_failure` (401) →
  `assistant.turn_end` (turnId 0) → `session.error` (authorization) → `session.idle`.
- Zero tool calls, zero sub-agents.
- `results.json`: `builds:false, runs:false, score:0, session_time:"1s", premium_requests:0`,
  `fail_reason:"No csproj"`.
- `session-log.txt` is empty (16 bytes).
- App dir contains only `.git`, `.github`, `nuget.config` — no project was ever scaffolded.

### Root cause
Infrastructure/harness **credential (401) failure** at the transport layer, before any
migration reasoning occurred. The downstream "No csproj" / 3 failed features are a pure
**consequence** of the agent never executing — not a migration-skill problem.

### Implication for skill improvement
There is **nothing in this trial that classifies as skill-defect or skill-coverage-gap**.
The single problem (no project produced) is environmental (Tier-0). Per the
plan-and-apply discipline (devil's advocate + falsifiable check), **no skill edit is
warranted**: no skill change could prevent a 401, and editing the skill on this basis
would inject unfalsifiable noise. Recommendation deferred to human: refresh harness
auth and re-run the Compass trial to obtain real evidence.
