# Dev-agent slips — BackgroundTransfer (no skill change)

## 1. Declared done on green validator + green smoke launch
- The agent ran `Test-AppLaunch.ps1` (status=running) and `Validate-UwpMigration.ps1`
  (PASS) and stopped. Both genuinely passed; the startup crash is an intermittent race
  the launch didn't reproduce.
- Covered clearly at SKILL.md ("'it compiled' is not 'it runs'") + "Diagnosing Startup
  Crashes". The agent followed the process; the checks were simply unable to catch a race.
- **No skill change for the agent's behaviour** — the real fix is to prevent the fragile
  ctor-navigation pattern statically (see skill-coverage-gaps.md).
