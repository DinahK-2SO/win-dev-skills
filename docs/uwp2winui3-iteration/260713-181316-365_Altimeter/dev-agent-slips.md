# Dev-Agent Slips — Altimeter

### Navigate-in-constructor (recovered via documented pattern)
- The agent wrote `RootFrame.Navigate(typeof(MainPage))` in the `MainWindow` constructor
  despite MIGRATION-PATTERNS.md #windowing (lines 193-231) spelling out that the
  constructor must stay inert and navigation must be deferred to `Activated`.
- **Covered clearly at:** MIGRATION-PATTERNS.md 193-231 (verbatim Activated-deferred
  `RootFrame.Navigate` example).
- **Slip type:** did-not-read; recovered in ~3 turns.
- **Note:** Because the *shell-building* step (SKILL.md Shell Conversion) offers no forward
  pointer to that pattern, the corrective action is a cross-reference (coverage-gap #2),
  not a restatement of the already-clear reactive guidance.
