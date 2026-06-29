# Dev-agent slips — BluetoothLE (will NOT change skill)

### 1. Used try/catch to "fix" compile errors
- **Evidence:** session-log turn 56 wraps `OnNavigatedTo` in try/catch while leaving `Application.Suspending/Resuming` and missing PHY members.
- **Covered clearly at:** SKILL.md "Defensive UI for init-heavy and device-dependent pages" scopes try/catch to *runtime* init failures, not build errors.
- **Slip type:** read-but-ignored. A capable model knows try/catch can't mask a compile error.
- **Why no skill change:** the misuse is downstream of the two *absent* build-error patterns (handled as skill-defects). Fixing those removes the temptation; no slip-specific edit needed.
