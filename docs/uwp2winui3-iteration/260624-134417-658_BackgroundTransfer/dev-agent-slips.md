# Dev-agent-slips — BackgroundTransfer (no skill change)

## 1. `dotnet build | Where-Object {...}` hang
- **Evidence:** session-log 7016-7052 (polled a hanging filtered build, then stopped + re-ran unfiltered).
- **Covered clearly at:** SKILL.md lines 141-142 — explicit callout against filtering
  `dotnet build`/`run` output, with three correct alternatives.
- **Slip type:** read-but-ignored. No skill change needed.

## 2. CA1416 / CS8612 / CS8625 warnings (1090 total)
- **Evidence:** build-output.txt; '[PASS] ... 1090 warning(s), 0 WUI analyzer warning(s)'.
- **Covered clearly at:** Validate-UwpMigration.ps1 gates only on WUI analyzer warnings +
  build errors; non-WUI warnings are tolerated by design.
- **Slip type:** non-issue. Non-blocking, expected for WinRT-on-desktop. No skill change.
