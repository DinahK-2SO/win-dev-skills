# Lessons — ExtendedExecution (UWP → WinUI 3)

**Outcome:** score 100, builds ✅, runs ✅, 4/4 features pass. The migration is faithful — but the log reveals one **latent, generalizable notification-migration trap** that only escaped scoring because its code path is unreachable on a headless dev box.

## Headline lesson (high-value struggle)
The dev-agent did the *right* thing first: it replaced UWP `ToastNotificationManager` with WinAppSDK `AppNotificationManager` + `AppNotificationBuilder` and added `AppNotificationManager.Default.Register()` in the `App` constructor (log turn ~40, `SampleConfiguration.cs` + `App.xaml.cs`).

The app then **crashed at startup**: `0xc000027b` native stowed exception in `Microsoft.UI.Xaml.dll` (Test-AppLaunch FAIL, turns 42–44). Root cause: `Register()` needs the `windows.toastNotificationActivation` + `windows.comServer` COM activator extension declared in `Package.appxmanifest`; it was absent.

Lacking that knowledge, the agent **misattributed** the crash and **reverted** both changes (turns 45–46) back to `Windows.UI.Notifications.ToastNotificationManager.CreateToastNotifier().Show(...)`, commenting "works for packaged apps and avoids registration issues." That builds green and launches alive — but is a latent runtime defect (the parameterless `CreateToastNotifier()` throws in an *unpackaged* WinUI 3 desktop app), and it abandons the correct WinAppSDK API entirely.

## What worked
- `ExtendedExecutionSession` (WinRT) migrated as-is; returns `Denied` on a dev box, matching UWP.
- `Dispatcher.RunAsync(CoreDispatcherPriority…)` → `DispatcherQueue.TryEnqueue(...)` per PATTERNS.md#threading (TODO[migrate-002..005]) — clean.
- Bootstrap namespace rewrite + manifest reshape + Test-AppLaunch crash capture + Validate gate all functioned well.

## Why tooling didn't catch the revert
- Residue grep only scans `unsupported`/`residueOnly` inventory patterns, **not** `adaptable`, so a reverted `ToastNotificationManager` passes clean.
- Smoke launch only proves the process is alive 10s; the toast fires on a later *Allowed* path that is `Denied` on this host, so the latent bug never executes.

Net: this is a documentation gap in `MIGRATION-PATTERNS.md#notifications`, not a tooling or agent-diligence failure.
