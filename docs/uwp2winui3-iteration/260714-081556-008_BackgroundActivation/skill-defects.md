# Skill defects — Background Activation

- **Analyzer under-detects the in-process background family.** `unsupported-api-inventory.json` matches only `IBackgroundTask|BackgroundTaskBuilder`. Files driving background activation via `BackgroundExecutionManager`, `BackgroundTaskRegistrationGroup`, `SystemTrigger`/`TimeTrigger`/`ApplicationTrigger`, or `Application.OnBackgroundActivated` are never routed to the `background-tasks` anchor. *Generalizes:* the single-process/in-process pattern is the common case for UWP background samples.
