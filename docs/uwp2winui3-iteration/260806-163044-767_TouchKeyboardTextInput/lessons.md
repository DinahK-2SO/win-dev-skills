# Lessons: TouchKeyboardTextInput

- **Linked project items were invisible to the bootstrap.** The UWP csproj linked its shared application shell, pages, styles, code, and assets from outside the project directory. The four-file mapping forced manual reconstruction from `obj` and sibling shared folders.
- **The build command was wrong.** `winapp build` is not available in the installed CLI; `dotnet build` worked cleanly.
- **Runtime validation was valuable but its diagnosis was not.** `Test-AppLaunch.ps1` and the validator consistently caught `0xc000027b` in `Microsoft.UI.Xaml.dll`, but no event 1026 stack existed and the unsupported-API hint sent diagnosis in the wrong direction.
- **Resource providers must survive XAML isolation.** Deleting a merged dictionary or `Styles.xaml` while startup pages still reference its keys leaves another opaque native XAML failure.
- **Dependent commands must remain sequential.** Parallel bootstrap/self-check and build/launch calls produced transient false and unavailable results.

## Dev-agent struggles

1. Turns 4-14: searched generated and shared content, then manually reconstructed files omitted by the bootstrap.
2. Turns 17-28: made several speculative XAML/window/resource edits without resolving the startup crash.
3. Turns 2 and 16: raced dependent commands; reruns recovered.

## Errors

- `winapp build` was unsupported; `dotnet build` succeeded.
- Startup repeatedly failed with `0xc000027b` in `Microsoft.UI.Xaml.dll`; the managed cause was unavailable and the trial ended unresolved.
