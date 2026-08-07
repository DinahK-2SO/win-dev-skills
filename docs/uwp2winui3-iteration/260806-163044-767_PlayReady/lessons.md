# PlayReady migration lessons

- **Helpful:** the bootstrap produced the mapping/TODO inventory; incremental `dotnet build` reached a clean build; `Test-AppLaunch.ps1` plus WER event 1026 exposed the startup exception.
- **Tool gap:** launch discovery ignored default `bin\Debug` output and required an unnecessary `-p:Platform=x64` rebuild.
- **Root launch cause:** the copied manifest retained the UWP literal `EntryPoint="PlayReady.App"` instead of WinUI 3's `EntryPoint="$targetentrypoint$"`.
- **Packaging regression:** adding `WindowsPackageType=None` removed the built package manifest and could not solve the activation failure.
- **Documentation correction:** `WMC9999` is a cascading XAML compiler error, not proof of a missing resource key; fix specific compiler errors first.
- **Resolved build errors:** project namespace alignment, missing WinUI imports, stale color APIs, temporary XAML under the compile glob, and missing manifest images.

