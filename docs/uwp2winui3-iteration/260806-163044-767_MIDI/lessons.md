# MIDI migration lessons

- **Bootstrap worked for local files but omitted project-linked inputs.** The UWP csproj linked shared `App`, `MainPage`, styles, and package assets from outside the source directory. Their omission forced turns 5-23 into manual shell reconstruction and caused follow-on compiler and deployment errors.
- **Build guidance was wrong for the installed CLI.** `winapp build` does not exist; the reliable command is `dotnet build <csproj> -p:Platform=<host-arch>`.
- **The first three bootstrap commands must be sequential.** Parallel execution raced initialization against `dotnet new` and produced a false missing-target failure.
- **Validation correctly blocked an incomplete result.** It caught unfinished mapping rows and the persistent `0xc000027b` startup crash.
- **The final startup failure remained unresolved.** No managed event 1026 was available, and the final code still violated the existing rule against constructor-time first navigation.

## Dev-agent struggles

- Turns 5-23: discovered and manually recreated omitted shared shell files; then fixed duplicate `Scenario`/configuration definitions and namespace errors.
- Turns 24-35: recovered from nonexistent `winapp build`, an unscoped `dotnet build`, and a missing linked splash asset.
- Turns 36-42: retried startup diagnostics and removed window chrome, but never applied the already-documented inert-constructor navigation pattern.

## Errors encountered

- Missing bootstrap target due to parallel command execution: rerun sequentially.
- `winapp build` unsupported: use explicit `dotnet build`.
- Duplicate shell/configuration declarations and XAML type errors: caused by manual reconstruction after linked files were omitted.
- Missing splash asset: reconcile manifest references or copy linked package content.
- Startup crash `0xc000027b`: unresolved in the trial.
