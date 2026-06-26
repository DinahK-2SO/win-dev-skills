# Skill coverage gaps — BackgroundMediaPlayback (→ WILL change skill)

## 1. Defensive-fallback rule is scoped to hardware only, not init-heavy pages  *(under-emphasized)*
- **Problem:** `Scenario1` throws during ctor/`Loaded` (creates a `MediaPlayer`, reads
  `PlaybackSession.PlaybackRate`, calls `SetMediaPlayer`, loads an `ms-appx:///` playlist asset,
  touches the `PlaybackService` singleton) with no guard, so a failure blanks the content frame.
- **Already covered at:** SKILL.md "Defensive UI for device-dependent features" — *"Wrap the init
  call in try/catch; on catch, swap the page's main content for the fallback."*
- **Why missed:** the rule's trigger list is physical hardware (camera, mic, location, sensors,
  Bluetooth, NFC). A media page is not obviously "hardware," so the agent didn't see it as in-scope
  — even though the failure mode is identical (init throws → blank frame → score loss).
- **Improvement:** Broaden the trigger to **any page doing non-trivial init in ctor/`Loaded`** —
  list media players, asset/file loads, service singletons, and ViewModel/DataContext wiring
  alongside hardware. Same prescription (try/catch + visible fallback). Note the process-alive
  smoke launch won't catch it; cross-link the new silent-navigation-failures anchor.
- **Generalizes:** Init-heavy pages (media, file/picker, network, storage-backed settings) are
  common across UWP samples; widening the rule makes them all degrade to a visible message instead
  of a blank frame.
