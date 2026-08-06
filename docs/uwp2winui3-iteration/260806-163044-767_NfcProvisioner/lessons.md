# NfcProvisioner migration lessons

- **Bootstrap:** only 4 physical project files were copied; 13 linked shared shell/resource items had to be found and copied manually.
- **Manifest:** presence checks were insufficient. AppX child ordering and the WinUI `$targetentrypoint$` placeholder are launch-critical.
- **Runtime gate:** an unavailable launch is not evidence that the app runs; allowing it to pass masked the scorer's reproducible `Arg_COMException`.
- **Useful diagnostics:** the validator and launch helper found the startup crash, while the event 1026 stack finally identified `Application.Start` / `Program.Main`.
- **Agent slips:** parallel bootstrap/self-check, running `dotnet run` from the wrong directory, adding `required` to a XAML-created type, and concurrent launch/validation each caused avoidable retries.
