# Discrepancies — BackgroundTask

**Score 50** — builds ✅, runs ✅, but all 6 scenarios are `partial`.

| # | Scenario | Status | Why |
|---|----------|--------|-----|
| 1 | Background Task | partial | Register dead — Status stays "Unregistered" |
| 2 | Background Task with Condition | partial | Register dead |
| 3 | Servicing Complete Task | partial | Register dead |
| 4 | Background Task with Time Trigger | partial | Register dead |
| 5 | Background Task with Application Trigger | partial | Register dead → Signal unreachable |
| 6 | Grouped Background Task | partial | Register dead |

**Single root cause:** the build `Package.appxmanifest` has no
`<Extension Category="windows.backgroundTasks">`, so `BackgroundTaskBuilder.Register()` throws in
every scenario. The exception is swallowed (no try/catch), so the button appears dead rather than
erroring.

**Visual:** UWP flips Status → "Registered" and enables Unregister on click; the WinUI 3 app shows
no change (see `../001_score-BackgroundTask/notes/winui-s1-afterreg.png`).
