# Dev-agent slips (skill already clear → NO skill change)

## 1. CS0122 RootFrame accessed from App — read-but-ignored
Agent navigated from `App.OnLaunched` via private `RootFrame` (turn ~77). The canonical pattern at **PATTERNS.md#windowing (lines ~319-334)** navigates from `this.Activated` *inside* MainWindow. Following it avoids CS0122. One-off deviation.

## 2. Window.Current.VisibilityChanged — one-off, well covered
Documented at **#windowing** and flagged by analyzer **WUI0002** (line 693). Resolved with no friction.

## 3. MIGRATION-MAPPING status + asset subpath — self-correcting bookkeeping
Validator emitted the exact remediation ("flip to done or deferred"); asset path fixed in 1 turn. Trivial, not generalizable.
