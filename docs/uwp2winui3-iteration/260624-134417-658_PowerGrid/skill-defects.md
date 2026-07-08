# Skill defects — PowerGrid (WILL change skill)

## 1. SKILL.md tells the agent to compile with `winapp build`, which does not exist
- **Evidence:** session-log.txt L3742-3773 — `winapp build` → "'build' was not matched", exit 1; agent recovered with `dotnet build` (L3778). winapp help lists no `build` verb.
- **Skill state:** wrong. SKILL.md L126, L140, L173 (also MIGRATION-PATTERNS.md L726; Validate script comment L13-14).
- **Root cause:** winapp is a packaging/run/UI CLI (SKILL.md L14 says so); it never compiles. The plugin's real build command is `dotnet build`, used successfully elsewhere in the same trial — so `winapp build` is internally inconsistent and always fails.
- **Fix:** replace `winapp build` compile instructions with `dotnet build -c Debug -p:Platform=<arch>; "BUILD_EXIT=$LASTEXITCODE"`; reword the MIGRATION-PATTERNS analyzer line; fix the Validate script header comment.
- **Generalizes:** every scenario hits this same build instruction and fails identically — a universal, guaranteed stall removed by one command fix.
