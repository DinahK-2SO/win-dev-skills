# Discrepancies — BackgroundTransfer

Score **0**, builds **true**, runs **false**. One root cause fans out to all 7 features.

| # | Feature | Status | Reason |
|---|---------|--------|--------|
| 1 | File Download | fail | Startup crash 0xC000027B before first frame; 0/8 controls reachable |
| 2 | File Upload | fail | Unreachable; 0/5 |
| 3 | Completion Notifications | fail | Unreachable; 0/4 |
| 4 | Completion Groups | fail | Unreachable; 0/2 |
| 5 | Random Access Downloads | fail | Unreachable; 0/8 |
| 6 | Recoverable Errors | fail | Unreachable; 0/5 |
| 7 | Download Reordering | fail | Unreachable; 0/4 |

**Visual:** every WinUI 3 screenshot is 0 bytes ("No process found with PID 10264") —
the process died during activation.

**Summary:** the migrated app crashes at startup because the first `Frame.Navigate` and
the initial `NavigationView` selection run in constructors before `Window.Activate()`.
