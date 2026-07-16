# Dev-agent slips: CameraFrames (no skill change)

## 1. 6 mapping rows left at `Status=copied`
- Validator caught it (`[FAIL] ... 6 row(s) still Status=copied`); agent flipped to `done` and re-ran → PASS.
- **Covered clearly at:** SKILL.md Step 1 (flip Status copied→done) and Step 4 (validator check 3 + explicit fix note). Self-corrected in one step → slip, no skill change.

## 2. Scenario 2 select→Start→preview flow unverified
- `invokeOk=false`: no camera → no selectable source group → Start/Stop correctly disabled. UWP golden also hung on the same no-camera hardware.
- **Not a skill issue:** environment-limited + measurement artifact (empty `x:Name` on UWP source combos). All controls present with AutomationIds and correctly gated. No skill edit could change this; eval harness is out of scope.
