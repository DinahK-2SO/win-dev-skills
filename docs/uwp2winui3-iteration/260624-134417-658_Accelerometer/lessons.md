# Lessons — Accelerometer (UWP → WinUI 3)

**Outcome:** builds (0 errors, 0 WUI warnings) but **crashes at startup** → score 0/6, every scenario unreachable.

## The crash
```
System.Runtime.InteropServices.COMException (0x8001010E):
  The application called an interface that was marshalled for a different thread.
  The Application Object must initially be accessed from the multi-thread apartment.
   at Microsoft.UI.Xaml.Application.Start(...)
   at Accelerometer.Program.Main(String[] args)
```
- Reproduced **with the correct SDK-generated `[STAThread]` Main** (session-log L5200-5206), *before* the agent touched the entry point → the entry point was **not** the cause.
- True cause is in the activation path (a thread-affined object reached during `App`/`MainWindow` construction, or a WindowsAppSDK package/runtime mismatch).

## What worked
- `Validate-UwpMigration.ps1` Section 7 + `Test-AppLaunch.ps1` **detected** the startup crash and captured the real WER exception (events 1000/1026). Detection was not the problem.
- The UWP `ReadingChanged` → `DispatcherQueue.TryEnqueue` threading conversion was done correctly.

## What went wrong (high-value)
1. **~250+ turns hunting for `Program.Main`.** The agent didn't know WinUI 3 auto-generates `Program.Main` into `obj/.../App.g.i.cs` (gated by `DISABLE_XAML_GENERATED_MAIN`) and spelunked NuGet packages/targets/templates for it.
2. **Mis-"fixed" the entry point.** It added `DISABLE_XAML_GENERATED_MAIN` + a hand-rolled `Program.cs` that drops `[STAThread]` and `WinRT.ComWrappersSupport.InitializeComWrappers()`, switching to MTA — the exact anti-pattern the skill warns against, but the warning was a buried parenthetical. App left permanently broken.

## Generalizable fix
Promote the skill's entry-point warning into a prominent **anti-pattern** in `MIGRATION-PATTERNS.md#startup-crashes`: a throw at `Application.Start`/`Program.Main` does **not** mean the entry point is wrong; never remove `[STAThread]`, switch to MTA, or add `DISABLE_XAML_GENERATED_MAIN` + a hand-rolled `Program.cs`; and note `Program.Main` is auto-generated into `App.g.i.cs` so there is nothing to hunt for.
