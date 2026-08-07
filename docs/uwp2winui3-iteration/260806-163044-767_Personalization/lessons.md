# Personalization migration lessons

- **Helpful:** Bootstrap triage, anchored picker guidance, native `dotnet build`, the validator, and launch diagnostics all produced actionable signals.
- **Primary tooling gap:** The bootstrap copied only three local files and omitted fourteen authored items linked by the UWP project. The agent spent turns 5-12 reconstructing shared XAML, code, styles, and assets.
- **Wrong command:** `winapp build` is unavailable in the installed CLI; native `dotnet build` worked.
- **Launch limitation:** A normal build emitted under `bin\Debug`, but `Test-AppLaunch.ps1` searched only platform-qualified output.
- **Command contention:** Concurrent scaffold/bootstrap and run/build/validate operations caused target, restore, and locked-XAML-intermediate failures.
- **API handling:** File pickers require HWND initialization. The packaged `LockScreen` behavior carried over successfully.

## Errors

- Bootstrap raced scaffold creation; rerunning sequentially fixed it.
- Dispatcher priority resolved to the wrong namespace; full qualification fixed `CS1503`.
- Manually reconstructed styles and bindings caused `WMC0001`, `WMC0909`, `WMC1111`, and cascading `WMC9999`.
- An explicit SDK-style `Page` item caused `NETSDK1022`; removing it restored implicit inclusion.
- Parallel builds locked `obj\x64\...\input.json`; isolated validation passed.
