# Dev-agent slips — Altimeter (will NOT change skill)

## 1. Manifest carried over verbatim (covered clearly)
- Validator FAILed on `-sdk` assets, Windows.Universal, missing rescap/runFullTrust (Turn 44) → agent fixed (Turn 47) → PASS (Turn 48).
- Covered at MIGRATION-PATTERNS.md manifest H3s + enforced by Validate-UwpMigration.ps1 with inline fixes.
- Slip type: one-off; a re-run applies the documented fixes. (Separate minor anchor-discoverability tweak noted in the plan — content itself is present.)

## 2. Hardware-gated Polling button non-responsive
- Host has no altimeter; identical 'No altimeter found' state in both apps. Environment, not a migration defect. Nothing to change.
