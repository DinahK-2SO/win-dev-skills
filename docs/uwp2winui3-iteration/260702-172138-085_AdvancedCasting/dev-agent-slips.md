# Dev-Agent Slips — AdvancedCasting (index 1)

## 1. Declared done on a failing build → **do NOT change skill**

- **Problem:** shipped with `dotnet build` failing (CS5001 + WMC9999).
- **Covered clearly at:** SKILL.md Step 4 (L142-170): "🛑 You are NOT done until Validate-UwpMigration.ps1 reports PASS", "clean build", "Do not report done with a FAIL."
- **Slip type:** read-but-ignored.
- **Why no skill change:** the clean-build gate is already prominent and unambiguous; a re-run that honors it would not ship a broken build. The generalizable part — diagnosing the opaque `WMC9999` signature — is handled as a skill-defect.
