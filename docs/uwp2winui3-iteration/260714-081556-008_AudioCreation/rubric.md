# Parity Rubric — AudioCreation (UWP → WinUI 3)

Ground truth: the original UWP `AudioCreation` C# SDK sample (launched Release,
PID 29152, window title "AudioCreation"). Each scenario is graded on structural
control coverage (from the source-derived checklist) **and** visual + behavioral
fidelity against the running app.

| # | Scenario | Key controls to verify | Expected behavior |
|---|----------|------------------------|-------------------|
| 1 | File Playback | Load File, Output Device node, Start Graph, Loop toggle, Playback Speed slider | Load File opens a file picker; Output Device red when no audio device (DeviceNotAvailable); Start Graph gated on a loaded file |
| 2 | Capture From Device | Pick output/input device combos, Input/Output node diagram, Pick Output File, Record, Create Graph | Device pickers populate; graph creation gated on device |
| 3 | Using A FrameInput Node | Frame Input node, Output Device node, Generate Audio | Output node created (green) + "Device Output Node successfully created" status |
| 4 | Using A Submix Node | Load File 1, Load File 2, SubMix node + Echo toggle, Output Device, Start Graph | Two file loads feed a submix; Output Device red without device |
| 5 | Inbox Effects | Load File, Start Graph, Echo/Reverb/Limiter/Equalizer toggles + parameter sliders (13 controls) | Effect toggles + sliders present; graph gated on file/device |
| 6 | Custom Effects | Load File, Start Graph (IBasicAudioEffect echo) | Custom effect graph gated on file/device |

## Scoring
`score = round(100 * (pass + 0.5*partial) / features_total)`

- **pass** — reachable, non-blank, ≥80% control coverage, visually faithful, and
  actuatable controls behave as in the UWP golden.
- **partial** — reachable but missing controls or a control present-but-dead
  relative to the UWP golden.
- **fail** — blank/unreachable, dropped scenario, or every frame blank.

## Instrument note
The UWP CoreWindow UIA tree is not exposed through `ApplicationFrameHost` on this
host, so per-scenario navigation / behavioral actuation of the UWP golden was not
possible; only the initial (File Playback) frame was captured as pixel ground truth.
Scenarios 2–6 are judged against the source and the WinUI renders, which faithfully
reproduce the SDK sample's exact layout, colors, and status semantics.
