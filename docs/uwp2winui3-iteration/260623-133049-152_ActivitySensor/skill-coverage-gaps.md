# Skill coverage gaps — ActivitySensor (WILL change skill)

## 1. In-process background task → WinUI 3 (manifest + OnBackgroundActivated)
- **Evidence:** turns 50-52 `CS0246 BackgroundActivatedEventArgs`; turn 48 AppX
  `0x80080204` (EntryPoint without ActivatableClassId); turn 54 `0xC00CE169`
  (inProcessServer enumeration violation). ~9 turns, 3 failed launches.
- **Covered at:** `MIGRATION-PATTERNS.md` `## Background Tasks` — but only mentions
  BackgroundTaskBuilder / Task Scheduler; silent on the keep-the-in-process-task path.
- **Why missed:** under-emphasized; no guidance on `OnBackgroundActivated` absence or the
  package-level `inProcessServer` manifest placement.
- **Improvement:** add a concrete sub-block with the correct manifest snippet (package-root
  `<Extensions>`), the "don't add OnBackgroundActivated" rule, and the exact errors it
  prevents.
- **Generalizes:** identical fix for any UWP in-process `IBackgroundTask` ported to packaged
  WinUI 3.
