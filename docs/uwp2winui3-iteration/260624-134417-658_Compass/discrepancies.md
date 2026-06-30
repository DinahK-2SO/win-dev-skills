# Parity Discrepancies — Compass (WinUI 3 vs UWP)

## Summary
The migration trial (`000_Compass`) produced **no WinUI 3 project at all**. The
`app` folder contains only `.git`, `.github`, and `nuget.config` — there is no
`.csproj`, no `.sln`, and no source. `dotnet run` fails with:

> Couldn't find a project to run. Ensure a project exists in
> ...\000_Compass\app, or pass the path to the project using --project.

This matches the trial's own `results.json` (`builds:false`, `runs:false`,
`fail_reason:"No csproj"`).

Because the migrated app cannot be built or launched, **every scenario captured
from the UWP golden has no WinUI 3 counterpart** to compare against. All controls
are therefore missing/dead in WinUI and every feature is scored **FAIL**.

The original UWP app launched and rendered correctly (golden screenshots in
`parity/baseline/screenshots/`), so this is a genuine migration failure, not a
measurement gap.

## Per-feature discrepancies

| # | Scenario | UWP (golden) | WinUI 3 | Verdict | Discrepancy |
|---|----------|--------------|---------|---------|-------------|
| 1 | Data Events | Present (Enable/Disable buttons, 3 output rows). Sensor data hardware-gated ("No compass found"). | **Absent** — app does not exist/launch | FAIL | Entire scenario missing: no project produced |
| 2 | Polling | Present (Enable/Disable buttons, 3 output rows) | **Absent** | FAIL | Entire scenario missing: no project produced |
| 3 | Calibration | Present (High/Approximate/Unreliable radio buttons) | **Absent** | FAIL | Entire scenario missing: no project produced |

## Notes
- UWP behavioral exercise: the per-scenario nav clicks reported `responded:false`
  for every control. Two contributing factors: (a) the sample's ListBox nav items
  read "1) Data Events" etc. rather than the bare titles, so title-driven invoke
  did not switch pages during capture; (b) more fundamentally, there is **no
  compass hardware**, so even the visible Enable/Disable buttons produce no sensor
  output ("No compass found"). UWP control responses are thus hardware-gated and
  not usable as a behavioral signal here. This does not affect the score: the
  WinUI app is absent, so all features fail on structure alone.
