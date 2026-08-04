# Lessons — DatagramSocket (UWP → WinUI 3)

**Outcome:** score 100/100, all 5 features pass, 0 parity discrepancies. The final app is
correct; the value here is in the *build-time struggles* the agent had to solve by hand.

## Dev-agent struggles (from build-events.jsonl)

1. **CS0118 — app namespace shadows a WinRT type.**
   `'DatagramSocket' is a namespace but is used like a type`. The UWP SDK sample is named
   after the API it demonstrates, so the generated app root namespace (`DatagramSocket`)
   collides with `Windows.Networking.Sockets.DatagramSocket`. Unqualified references bind
   to the namespace. Fixed with a `using` alias / full qualification.
   → **Generalizes:** UWP SDK samples are conventionally named after their API
   (`DatagramSocket`, `StreamSocket`, `MediaCapture`, `Compositor`, ...), so this
   collision recurs whenever the sample's subject type shares its name.

2. **CoreApplication.Properties removed.** Used as a cross-page shared key-value store
   across the `ScenarioN` pages (active socket, adapter list). Not available in WinUI 3.
   Fixed by introducing a static `AppState` dictionary.
   → **Generalizes:** the SDK-sample `SampleConfiguration` pattern uses
   `CoreApplication.Properties` as shared state in most multi-scenario samples.

3. **CS0103 `AppState` not found / CS0246 cascade** — mostly symptoms of (1)+(2): helper
   placed in one namespace, scenario pages in another. Resolved with a `using` directive.

## Errors → root cause → fix
- CS0118 namespace-vs-type collision → using alias / qualify.
- CoreApplication.Properties → static shared-state class.
- CS0103/CS0246 cascade → resolved once (1)+(2) were fixed.
