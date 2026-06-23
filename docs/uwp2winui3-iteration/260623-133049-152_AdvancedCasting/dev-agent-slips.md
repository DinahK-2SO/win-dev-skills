# Dev-agent slips — AdvancedCasting (no skill change)

No pure slips. The one candidate (agent accepting the launch WARN as an environment
issue) is **not** a slip: the migration tooling and SKILL.md L160 explicitly told the
agent a no-AUMID launch failure is "not a code defect" and the validator returned PASS.
The agent followed the skill correctly; the guidance was wrong. It is therefore handled as
a **skill-defect** (see `skill-defects.json` item 2), not excluded from skill changes.
