# Dev-Agent Slips — Accelerometer (will NOT change skill)

## 1. Never built / never validated
- **Problem:** No `dotnet build` / `winapp build` / `Validate-UwpMigration.ps1` ran the whole
  trial; the session ended at TURN 26 still viewing source and assets.
- **Covered clearly at:** SKILL.md Step 3 (build→fix→launch loop) and Step 4
  (🛑 "You are NOT done until `Validate-UwpMigration.ps1` reports PASS").
- **Slip type:** did-not-read.
- **Why no skill change:** Already prominently mandated with 🛑 markers; louder prose would be
  noise. The build-breaking collision is fixed independently at the tooling tier (bootstrap guard),
  so it no longer depends on *when* the agent first builds.
