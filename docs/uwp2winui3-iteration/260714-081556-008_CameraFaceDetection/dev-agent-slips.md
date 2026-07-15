# Dev-agent slips (NO skill change)

## 1. Partial score from missing camera hardware
- **Evidence:** buttons present with correct AutomationIds but `IsEnabled=False`; identical to the UWP golden.
- **Covered clearly at:** SKILL.md L196-202 (defensive UI) — already applied by the agent.
- **Why no skill change:** hardware-gating artifact; the defensive-UI guidance worked. No skill edit could raise the score without a camera.
