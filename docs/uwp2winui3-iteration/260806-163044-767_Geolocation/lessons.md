# Geolocation migration lessons

- **Bootstrap was incomplete:** it ignored csproj-linked shared XAML/assets, copied legacy assembly metadata, and replaced the scaffold desktop manifest. This drove most of the manual reconstruction and build retries.
- **Background-task guidance was wrong:** a UWP `TaskEntryPoint` declaration is not sufficient in a desktop package. Non-audio tasks need an activatable packaged WinRT/COM class; otherwise registration fails with `0x80080204`.
- **Build command was wrong:** this `winapp` installation has no `build` subcommand; `dotnet build` worked.
- **Agent slips:** the mandatory bootstrap commands were parallelized, and the agent stopped with unresolved TODOs without running the mandatory validator.

The full error-to-root-cause-to-fix chains are recorded in `lessons.json`.
