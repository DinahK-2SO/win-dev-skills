# Dev-agent slips

- Ran `dotnet run` from the parent directory before adding the known `--project` path.
- Regenerated XAML despite the prominent preserve-and-transform rule, introducing duplicate declarations and malformed XAML over four build retries.
- Ignored the manifest checklist it had just fetched, causing the predicted missing-splash registration failure.
- Used long-running `dotnet run` instead of the explicitly required `Test-AppLaunch.ps1`.
