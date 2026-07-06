# Lessons — BluetoothRfcommChat (UWP → WinUI 3)

**Outcome:** Migration trial recorded `score:0, builds:false, runs:false, timeout:true`.
The independent scoring trial found the app actually **builds, launches, and passes 3/3
features (100%)** — the trial simply **ran out of time**, it did not fail technically.

## What worked
- `Initialize-UwpMigration.ps1` (once the source resolved) copied 9 files, rewrote
  namespaces, and seeded the mapping + 17 TODOs correctly.
- `Validate-UwpMigration.ps1` reported PASS at the end (clean build, 0 WUI warnings,
  smoke launch alive) — confirming the work was genuinely complete.

## The two time sinks that caused the timeout
1. **Source discovery (Turns 2–22, ~20 turns + 6 GitHub web_fetches).**
   `Initialize-UwpMigration.ps1` threw *"Source not found"* on the correct
   prompt-supplied path (the source directory had not yet materialized on disk). The
   agent responded by hunting the tree and **fetching the sample from
   github.com/microsoft/Windows-universal-samples six times** before retrying the local
   path, which then succeeded at Turn 22. The skill never tells the agent the source is
   *always local* and must not be reconstructed from the web.
2. **`Application.Suspending` (Turns ~74–76, final loop).**
   The UWP pages subscribe to `App.Current.Suspending`. `Microsoft.UI.Xaml.Application`
   has **no `Suspending` event** → `CS1061` (and a related `CS0103` on `App`). The agent
   discovered the `CoreApplication.Suspending` fix by trial in the last, timeout-adjacent
   turns. `MIGRATION-PATTERNS.md` has **zero** coverage of `Suspending`.

## Generalizable fixes (see improvement-plan.json)
- SKILL.md Step 0: state the UWP source is the local prompt path; never fetch it from the
  internet; retry the same path on a transient "Source not found".
- MIGRATION-PATTERNS.md lifecycle section: add the `Application.Suspending` /
  `OnSuspending` removal pattern.
