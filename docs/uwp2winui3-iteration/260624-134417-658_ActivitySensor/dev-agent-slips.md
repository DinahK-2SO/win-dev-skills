# Dev-agent slips (NO skill change) — ActivitySensor

## 1. Background activity 'Register Task' no verifiable response (partial)
- Handler is correctly wired (BackgroundTaskBuilder + ActivitySensorTrigger), matching **MIGRATION-PATTERNS.md ## Background Tasks**. The non-response is an environment limitation (sensorless machine, background-access policy) with no UWP behavioral baseline. No skill edit helps; migration is faithful.

## 2. Reactive hardcoded `<Compile Remove="Tasks\obj\**"/>`
- Same root cause as the CS0579 skill-defect; the durable fix (excluding obj/bin at copy time) removes the need for any reactive csproj patch. Listed only to avoid double-counting.
