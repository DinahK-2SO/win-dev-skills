# Dev-agent slips — AppServices (→ NO skill change)

- **CS0120 `AppInstance.GetActivatedEventArgs()` called as static.** Skill already shows
  the correct `AppInstance.GetCurrent().GetActivatedEventArgs()` form prominently in the
  activation code sample (MIGRATION-PATTERNS.md ~line 324). read-but-ignored.
- **CS0246 `MainPage` missing `using SDKTemplate`.** Trivial missing-using fix; same class
  as the existing CS0104 guidance. one-off-mistake; a capable model self-corrects.
