# BasicSuspension — lessons

**Outcome:** score 100, builds ✓, runs ✓, parity pass. One build failure during
development, self-recovered. No parity discrepancies. The value here is a *generalizable
lifecycle gap* the dev-agent hit and had to solve without skill guidance.

## Key finding — `Application.Suspending` does not exist in WinUI 3
- UWP source wired `this.Suspending += OnSuspending;` (classic SuspensionManager
  template) to save session state.
- WinUI 3 `Microsoft.UI.Xaml.Application` has **no** `Suspending` / `Resuming` /
  `EnteredBackground` / `LeavingBackground` events → **CS1061** at build.
- Fix the agent found: drop the `Suspending` hook + `OnSuspending`/`SuspendingEventArgs`
  deferral handler, and save state from **`Window.Closed`**
  (`window.Closed += async (s,a) => await SuspensionManager.SaveAsync();`). The unused
  `Windows.ApplicationModel` using is removed.
- A secondary `XamlCompiler WMC9999` internal error was a **cascade** of the failed C#
  compile and vanished once CS1061 was fixed.

## Tools
- Helpful: `Get-MigrationPattern.ps1 -Anchor lifecycle`, `dotnet build -p:Platform=x64`.
- Limitation: the `lifecycle` anchor only covers **activation** events
  (`OnLaunched`/`OnActivated`/`OnFileActivated`), so it returned nothing about the
  `Suspending` event that actually broke the build.
- Friction (agent-side, not skill): piping `dotnet build` through `Select-String` looked
  like a hang; agent stopped and re-ran unfiltered.

## Struggle → prevention
The dev-agent recovered, but only by inferring the `Window.Closed` replacement. A skill
that named the removed lifecycle events and their replacement would have made this a
zero-retry migration. This recurs across essentially every UWP app built from the SDK
sample / VS templates, which almost all ship the SuspensionManager `Suspending` wiring.
