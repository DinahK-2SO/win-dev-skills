# Dev-agent slips

- **Startup crash:** navigated from `MainWindow` construction and read the unassigned static window despite a dedicated initialization-order section.
- **Build/launch race:** launched diagnostics in parallel with build despite the explicit sequential loop.
- **Unneeded custom entry point:** added `Program.Main` and incurred avoidable symbol/setup errors despite guidance to retain SDK generation when possible.
