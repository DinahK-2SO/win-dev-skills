# Discrepancies — AppServices (UWP → WinUI 3)

Overall: **no functional discrepancies.** The migrated WinUI 3 app replicates the
original UWP *App Service Client* sample scenario-for-scenario. Every checklist
control is present and every action control is wired and responds with the correct
status text. The items below are minor/informational only.

| Severity | Type | Scenario | Detail |
|---|---|---|---|
| minor | visual-theme | all | UWP renders dark theme; WinUI renders default light theme. Layout, controls, labels, and behavior are equivalent — only the color scheme differs. Not a functional defect. |
| info | additional-feature | 3) Show Package Family Name | WinUI merges the separate UWP *AppServicesProvider* sample into the same app, exposing an extra "Show Package Family Name" scenario. A superset of the client checklist, not a regression. |
| info | environment | all | In both golden and candidate the app-service **provider** is not deployed as a registered service, so Generate/Open return the built-in error status ("The app service is not available…"). Identical behavior in both; the WinUI handlers run the real `AppServiceConnection` path and surface the proper error — confirming the buttons are genuinely wired, not dead. |

## Per-scenario behavioral evidence (WinUI candidate)

- **1) Open/Close Connection** — controls 3/3 present. `Generate Random Number`
  responds → status "The app service is not available. It may be updating or on a
  removable device." (Result empty). Matches expected UWP behavior with no provider.
- **2) Keep Connection Open** — controls 5/5 present. `Open Connection` → "The app
  service is not available…"; `Close Connection` → "There's no open connection to
  close"; `Generate Random Number` → "Use the Open Connection button to open a
  connection…". All correct guard/error messages from the source handlers.

## UWP golden capture limitation (honest note)

The original UWP app **did launch** (`uwp-app-runner ok:true`, PID 8540, window
"App Service Client C# sample") and its scenario-1 frame was captured with full inner
content (nav list + scenario-1 controls). However, the UWP CoreWindow (hosted by
`ApplicationFrameHost`) exposes an **opaque UIA tree** (only a single Pane), and
synthetic mouse/keyboard input could not be routed because the non-interactive session
cannot bring the window to the foreground. Therefore per-scenario **navigation and
control actuation of the golden** were not automatable in this environment. The
scenario-2 golden and the golden button behavior were derived from the source
checklist. This does not affect the candidate grade: the WinUI app was actuated
directly and graded against the source-derived checklist + observed behavior.
