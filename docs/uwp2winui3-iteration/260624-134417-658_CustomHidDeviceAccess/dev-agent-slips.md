# Dev-agent slips — CustomHidDeviceAccess (will NOT change skill)

## 1. Build-timeout loop / premature builds:false
- **Problem:** Turns 63-70 spent in repeated 300s `dotnet build` timeouts + stop/clean/
  rebuild; agent ran out of budget and reported builds:false/runs:false though the app
  builds and launches.
- **Evidence:** session-log.txt tail (build4/build6 "still running after 300 seconds",
  dotnet clean turn 69, --no-incremental turn 70); migration-score.json note that
  builds/runs were false "due to a migration-time timeout, not a build error".
- **Covered clearly at:** SKILL.md line 141 (explicit warning against filtering dotnet
  build output, which the agent did with Select-String) + mandated native dotnet /
  Test-AppLaunch flow.
- **Slip type:** read-but-ignored. Environmental slowness; a re-run that builds once and
  waits avoids it. No skill change.
