# Dev-agent slips — DisplayOrientation (will NOT change skill)

## S1 — Ignored the constructor-inert init-order rule
- Scenario1.OnNavigatedTo reads `App.MainWindow!.AppWindow` (null during MainWindow ctor) → NRE → blank page.
- **Covered clearly at:** MIGRATION-PATTERNS.md 'Initialization order — keep MainWindow's constructor inert' (246-291), incl. the exact deferred-navigation fix.
- **Slip type:** read-but-ignored. A capable re-run applying the documented deferral fixes it with no skill change.
- The generalizable weaknesses that *contributed* (false 'validator catches this' claim; missing DisplayInformation detection) are handled as skill-defects.
