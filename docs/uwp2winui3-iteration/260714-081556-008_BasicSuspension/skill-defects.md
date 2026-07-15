# BasicSuspension — skill-defects (WILL change skill)

## 1. `Application.Suspending` lifecycle events are missing from the skill
- **Problem:** UWP `this.Suspending += OnSuspending` has no equivalent on the WinUI 3
  `Application` class → **CS1061** build failure. Skill gave no guidance.
- **Evidence:** `session-log.txt:1961` (CS1061 on `Suspending`); the `lifecycle` anchor
  (line 2059) returned only activation guidance; agent self-recovered via `Window.Closed`
  (Turns 13-20).
- **Skill state:** **absent** — the lifecycle anchor (MIGRATION-PATTERNS.md:316) covers
  only `OnLaunched`/`OnActivated`/`OnFileActivated`; nothing on `Suspending`/`Resuming`/
  `EnteredBackground`. Also absent from `unsupported-api-inventory.json`.
- **Fix:**
  1. Add a *Suspend / Resume lifecycle events* subsection to the `lifecycle` anchor:
     the events are removed; save/restore from `Window.Closed` (or AppLifecycle); drop
     `SuspendingEventArgs`/deferral + `Windows.ApplicationModel` using.
  2. Add an `adaptable` entry to `unsupported-api-inventory.json` (pattern for
     `.Suspending +=` / `SuspendingEventArgs` / `EnteredBackground`, anchor `lifecycle`)
     so the bootstrap injects an inline TODO **before** the build breaks.
- **Generalizes:** the SuspensionManager `Suspending` wiring shipped in nearly every UWP
  SDK sample and VS template; the fix prevents a recurring CS1061 corpus-wide.
