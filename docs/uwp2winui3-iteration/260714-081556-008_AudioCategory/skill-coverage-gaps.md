# Skill Coverage Gaps — AudioCategory (index 0)

Both items are grey-zone: the skill mentions the surrounding topic but not clearly/
prominently enough, and each generalizes across scenarios.

## 1. Skill-script invocation must be an absolute path (silent validation-skip risk)
- **Evidence:** session-log turn 4 (lines 4617-4623): `& : The module '.github' could not
  be loaded ... VALIDATE_EXIT=0`. The validator never ran but the exit code read 0.
- **Covered at:** SKILL.md `## Process` script list + invocation examples use
  `& "<skill-root>/scripts/X.ps1"` but never require an absolute path or warn about the
  relative-backslash module-qualified-command trap.
- **Fix:** add one invocation rule — resolve `<skill-root>` to an absolute path (or `.\`
  prefix); a bare `dir\script.ps1` is parsed as a module-qualified command and fails
  **without setting `$LASTEXITCODE`**, so an exit-code check falsely reads success.
- **Generalizes:** every scenario runs these four scripts on Windows; the trap and its
  false-pass on the mandatory validation gate can recur anywhere.

## 2. CS8618 on migrated SDK-sample model classes
- **Evidence:** session-log turns 1-3 (lines 4552-4610): 4x CS8618 on
  `SampleConfiguration.cs` `Scenario`, fixed with default initializers.
- **Covered at:** MIGRATION-PATTERNS.md `## Common build errors after the namespace
  rewrite` lists CS0104/CS0227/CS0101/CS0246 but not CS8618.
- **Fix:** add a short CS8618 subsection (cause: non-nullable auto-props copied into the
  nullable-enabled scaffold; fix: initialize or make nullable).
- **Generalizes:** `SampleConfiguration.cs` / ControlInfoData-style model classes ship in
  virtually every Microsoft UWP SDK sample and always emit CS8618 after migration.
