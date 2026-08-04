# Skill Defects — DatagramSocket (WILL change skill)

1. **CS0118: app namespace shadows a WinRT type.** UWP SDK samples are named after the
   API they demo, so the app root namespace (`DatagramSocket`) collides with
   `Windows.Networking.Sockets.DatagramSocket`. Not covered anywhere in the skill.
   *Fix:* add a build-error entry (using-alias / full-qualification).
   *Generalizes:* recurs for StreamSocket, MediaCapture, Compositor, etc.

2. **CoreApplication.Properties has no WinUI 3 equivalent.** Used as cross-page shared
   state by the SDK-sample scenario pages. Only `CoreApplicationViewTitleBar` and
   `CoreApplication.GetCurrentView()` are mapped; `.Properties` is absent.
   *Fix:* map `CoreApplication.Properties` -> a static shared-state class.
   *Generalizes:* the SampleConfiguration template uses it in most multi-scenario samples.
