# Lessons: CameraFrames (UWP → WinUI 3)

Strong migration — score 75% (1 pass, 1 partial). Build was clean; no CS errors in the log.

## Tools that helped
- **Initialize-UwpMigration.ps1** — seeded the mapping + TODO markers; file-by-file worked.
- **Validate-UwpMigration.ps1** — caught 6 rows still `Status=copied`, then PASS + clean smoke launch.

## Errors encountered
- **Validator FAIL: 6 rows still `Status=copied`** — agent forgot to flip Status to `done`. Fixed, re-ran → PASS. Skill covers this clearly (Step 4) → dev-agent slip.
- **git LF/CRLF warning** on a skill doc — cosmetic, non-fatal.

## Key dev-agent struggle (high value)
- **Duplicate camera-unavailable message.** The fallback shows the message twice: a static XAML headline TextBlock plus a dynamic `FallbackMessage` TextBlock set to the same literal string.
  - Root cause: the agent followed the skill's Defensive-UI wording ("a TextBlock saying '...' plus the exception's Message underneath") literally — building **two** text elements — then in the no-device empty-list branch (no exception to show) passed the fixed headline string into the detail line, duplicating it.
  - Preventable by: sharpening the Defensive-UI section so the headline is rendered once and the detail line is **exception-only** (empty when there is no exception).

## Environment
- No camera → both UWP and WinUI show "No source groups found."; UWP UI thread hung. Scenario 2's select→Start→preview flow is unverifiable for either app (not a migration defect).
