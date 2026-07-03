# Discrepancies — BackgroundTask (run19)

**score 0 · builds true · runs false**

All six scenarios `fail` with the same root cause: the migrated `Package.appxmanifest`
retained the UWP `windows.backgroundTasks` Extensions (`EntryPoint="Tasks.SampleBackgroundTask"`
and `EntryPoint="Tasks.ServicingComplete"`), which are invalid for a packaged WinUI 3 desktop
app. Package registration fails with `0x80080204`, so the app never renders and no scenario is
reachable.

- UWP golden: app launches, scenario list visible, Scenario 1 controls functional.
- WinUI: no window at all (registration failure) — no screenshots captured.

Suspected skill gap: `Background Tasks` pattern + `Manifest migration checklist` say nothing
about removing/reworking the `windows.backgroundTasks` manifest Extension.
