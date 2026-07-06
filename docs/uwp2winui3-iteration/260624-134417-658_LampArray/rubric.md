# Parity Rubric — LampArray C# Sample

Ground truth derived from the original UWP source and confirmed against the live UWP app
(window title: `LampArray C# sample`, launched Release via `uwp-app-runner`).

## Scenario 1 — LampArray Basics (`Scenario1_Basics`)
- **Controls:** `OffButton`, `SetColorButton` ("All green"), `GradientButton`, `WasdButton`
  ("Highlight WASD") radio buttons; `BrightnessSlider` (0–100); `Apply` button.
- **Actions:** the four radio buttons + `Apply`.
- **Outputs:** `LampArraysSummary` ("Attached LampArrays: N"), `StatusBlock`.
- **Expected visual:** left nav list with the two scenarios; right pane shows the
  Description, the four radios (Off selected by default), the Brightness slider, the Apply
  button, and "Attached LampArrays: 0".

## Scenario 2 — LampArray Effects (`Scenario2_Effects`)
- **Controls:** `PauseButton`, `PlayButton`, `StopButton`; `ImageBitmap` (Image).
- **Actions:** Pause / Play / Stop.
- **Outputs:** `LampArraysSummary`, `StatusBlock`.
- **Expected visual:** effect-playback buttons and an image surface; "Attached LampArrays: 0".

## Notes on behaviour
The test machine has **no physical LampArray device** attached ("Attached LampArrays: 0").
In the live UWP app the action controls therefore produce no visible on-screen change when
clicked (they drive device lighting, which is hardware-gated). Consequently a WinUI control
that is invoked but shows no response is **not** automatically a behavioural regression —
it must be judged against the equally-unresponsive UWP golden. The dominant fidelity signal
here is **visual rendering**, not action response.
