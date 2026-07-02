# Dev-agent slips — AdaptiveStreaming (iteration 1)

## 1. Build-output dll locked by a running app instance (transient)
- **Problem:** One rebuild failed with "The process cannot access the file ...
  AdaptiveStreaming.dll ... because it is being used by another process" (interop.targets 724).
- **Evidence:** session-log ~line 11486; the cleanup step stopped the AdaptiveStreaming process.
- **Slip type:** one-off-mistake / environmental race.
- **Why no skill change:** A stale running instance locking the output dll is environmental;
  the agent recovers by stopping the process before rebuilding. No skill guidance caused it
  and none would prevent it generally.
