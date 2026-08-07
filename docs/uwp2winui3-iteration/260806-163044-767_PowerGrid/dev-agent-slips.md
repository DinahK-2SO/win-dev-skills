# Dev-agent slips and external flakes

- **Bootstrap race:** the mandatory self-check ran before bootstrap completed, despite explicit ordering; rerun succeeded.
- **LaunchActivatedEventArgs ambiguity:** the exact CS0104 case already has a dedicated migration pattern.
- **Launcher qualification:** a one-off namespace omission in manually reconstructed code.
- **Foreground final run:** `dotnet run` was started after validator PASS and caused the trial timeout despite the provided detached launcher.
- **Splash-only UWP baseline:** both score partials were evaluation-reference limitations; the candidate itself passed 2/2 parity checks, so no migration-skill edit is justified.
