# Dev-agent slips — BackgroundSensors (→ NO skill change)

## 1. Nullable-reference warnings on background-task fields
- Agent fixed by declaring fields nullable + `Deferral?.Complete()` (turns 41–42).
- **Already covered clearly** at MIGRATION-PATTERNS.md line 166 (`<Nullable>enable</Nullable>` ⇒
  declare nullable). Warnings only; build/score unaffected. No skill edit.

## 2. CA1416 platform-compatibility warnings
- Dozens emitted for WinRT APIs; **BUILD SUCCEEDED** regardless and score was 100.
- Warnings only, no failure signal. Blanket suppression guidance would risk masking real platform
  issues with no falsifiable benefit. Out of scope.
