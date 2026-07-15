# Lessons — BluetoothAdvertisement (UWP → WinUI 3), score 75 (2 pass / 2 partial)

## Headline root cause
Scenarios 3 & 4 (Background watcher / publisher) migrated the UWP **in-process**
background-task model verbatim:
- `new BackgroundTaskBuilder()` with **`TaskEntryPoint` omitted** → in-process task
- dispatched in UWP via `App.OnBackgroundActivated`
- manifest declares `windows.activatableClass.inProcessServer` + `windows.backgroundTasks`

**WinUI 3 (`Microsoft.UI.Xaml.Application`) has no `OnBackgroundActivated`.** The stale
comment "See App.OnBackgroundActivated" survives in the ported code, but no such method
exists (and can't). So `RequestAccessAsync()`/`builder.Register()` fails at runtime with an
HRESULT other than the `E_DEVICE_NOT_AVAILABLE` the sample catches; because
`RunButton_Click` is `async void` and `RequestAccessAsync` is outside the try, the failure
is swallowed → **dead Run control, no status, Stop stays disabled**.

## Why existing guidance didn't catch it
- `MIGRATION-PATTERNS.md > Background Tasks` only covers the **out-of-process** model
  (string `TaskEntryPoint` + `windows.backgroundTasks` extension). The in-process variant
  is not mentioned.
- `Validate-UwpMigration.ps1` only checks that a `windows.backgroundTasks` extension
  exists. It **was present** here (EntryPoint = the task class), so the check PASSED —
  a green validator that hid a dead control.

## Generalizable fixes (feed the improvement step)
1. **skill-defect** — document the in-process background-task variant and that it has no
   WinUI 3 equivalent; instruct converting to out-of-process (string `TaskEntryPoint`)
   and broadening the registration catch + always surfacing a status.
2. **tooling gap** — validator should flag retained `BackgroundTaskBuilder` code that
   omits `TaskEntryPoint` (in-process) without an `OnBackgroundActivated` handler.
