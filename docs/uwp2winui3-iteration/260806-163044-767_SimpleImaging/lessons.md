# SimpleImaging migration lessons

- **Bootstrap gap:** the UWP csproj linked 13 shell/resource files from external `SharedContent`; the folder-only bootstrap copied 7 local files and silently omitted the shell.
- **Lifecycle gap:** UWP suspension handlers do not carry to WinUI 3 desktop. A fake `Suspending` event compiles but never persists state.
- **Build tooling:** native `dotnet build` worked; this environment's `winapp` had no `build` command. Launch discovery must accept both `bin\<platform>\Debug` and `bin\Debug`.
- **Runtime failure:** constructor-time navigation reached `MainPage.OnNavigatedTo`, which read `App.MainWindow` before assignment and produced the startup crash.
- **Useful paths:** picker TODO injection, the picker pattern, `dotnet build` diagnostics, and Windows Application event 1000 all provided actionable evidence.

## Errors encountered

- Shared XAML/code-behind namespace mismatch produced `CS0103`, `CS0117`, and `CS1061`.
- An unresolved `x:DataType` produced `WMC0909`/`WMC1111` and cascading `WMC9999`.
- UWP suspension subscriptions produced `CS1061`; adding a fake event compiled but did not preserve behavior.
- Startup exited with `0xC000027B` after the static-window initialization-order race.

## Dev-agent struggles

- Turns 7-25 manually recovered linked shell files and repaired multiple cascading build failures.
- Turns 14-16 switched away from unavailable `winapp build`; launch diagnosis raced the build and missed its layout.
- Turns 28-31 diagnosed the native startup code but did not apply the already-documented constructor-order fix.
