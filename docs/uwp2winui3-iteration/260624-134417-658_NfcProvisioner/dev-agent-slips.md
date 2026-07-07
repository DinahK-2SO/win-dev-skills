# Dev-agent slips — NfcProvisioner (iteration 0) — NOT changing the skill

1. **CS8803/CS0106 (methods outside class) in Scenario1.xaml.cs** — a misplaced closing brace during a large SEQUENTIAL edit. Covered clearly at SKILL.md Step 1 "Per-file execution mode" (SEQUENTIAL: small edits, build after each). Mechanical slip; a re-run repairs it. No skill change.

2. **WMC0909 'Cannot resolve DataType local:Scenario' in MainPage.xaml** — transient, tied to the concurrent class-structure breakage; cleared on a clean rebuild. x:Bind/x:DataType behavior already documented in MIGRATION-PATTERNS.md. No skill change.

3. **Blank/white WinUI screenshot capping the score at partial** — a WinUI 3 DirectComposition surface that the eval harness's GDI screenshot cannot grab (UIA shows all controls on-screen; Browse works). This is a measurement-instrument limitation in `winui3-parity-check` / `uwp-app-runner`, which are out of scope. Deferred to human; no migration-skill change.
