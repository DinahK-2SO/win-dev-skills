# Dev-agent slips — BackgroundTask (NO skill change)

- **Threading conversion** (Dispatcher.RunAsync → DispatcherQueue.TryEnqueue) was applied
  correctly across all 6 scenarios using the existing `threading` anchor / WUI0003 row.
  Documented and applied correctly — no skill change.
