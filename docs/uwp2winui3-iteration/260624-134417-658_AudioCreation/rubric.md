# Parity Rubric — AudioCreation (UWP → WinUI 3)

Ground-truth feature list derived from the original UWP source
(`uwp-samples-standalone/Samples/AudioCreation/cs`) and confirmed against the live UWP app.

Grading: `score = round(100 * (pass + 0.5*partial) / features_total)`.
A scenario is **pass** at ≥80% structural control coverage and reachable; **partial** at
≥40%; **fail** below 40% or blank/unreachable. A control present but **dead** (responds in
the UWP golden, dead in WinUI) caps a scenario at **partial**.

| # | Scenario | Controls | Actions to actuate | Expected output |
|---|----------|----------|--------------------|-----------------|
| 1 | File Playback | Load File, Output Device, Start Graph, Loop toggle, Playback Speed slider | Load File, Start Graph, Loop | Status text |
| 2 | Capture From Device | Pick Output File, Record, Create Graph, Output File / Audio Device status | Pick Output File, Record, Create Graph | Status text |
| 3 | Using A FrameInput Node | (informational — no interactive controls) | — | Description / status |
| 4 | Using A Submix Node | Load File 1, Load File 2, Echo toggle, Start Graph | Load File 1, Load File 2, Echo, Start Graph | Status text |
| 5 | Inbox Effects | Load File, Start Graph, ECHO/REVERB/LIMITER/EQUALIZER toggles, parameter sliders (13) | Load File, Start Graph, 4 effect toggles | Status text |
| 6 | Custom Effects | Load File, Start Graph | Load File, Start Graph | Status text |

## Environmental constraints affecting behavioral grading
- **No audio output device** on the scoring machine ("Device Output unavailable because
  DeviceNotAvailable" in the UWP app). AudioGraph-dependent actions (Start Graph, Create
  Graph, Record, effect toggles) cannot produce observable output in **either** app, so
  they are hardware-gated, not migration defects.
- **UWP UIA inaccessibility:** the UWP CoreWindow is hosted by `ApplicationFrameHost`, so
  `winapp ui invoke`/`inspect` resolve only the host pane — no UWP control could be
  actuated. The UWP golden therefore has **no recorded control responses** to diff
  against, so dead/no-output WinUI controls are flagged for review, not failed.
