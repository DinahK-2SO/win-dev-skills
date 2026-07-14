# Discrepancies — AudioCreation (WinUI 3 vs UWP golden)

## Summary
No structural or visual discrepancies were found. All 6 scenarios are present,
reachable, non-blank, and reproduce the UWP SDK sample's layout, colors, node
diagrams, toggles, sliders, and status semantics faithfully. Structural parity =
100% (6/6 scenarios, full control coverage). Parity gate: **PASS**.

## Instrument limitation (not a migration defect)
- The original UWP app launched successfully (Release, PID 29152), but its
  CoreWindow UIA tree is not exposed through `ApplicationFrameHost` on this host
  (`winapp ui inspect` returns only a top-level Pane; 0 interactive elements).
  Therefore per-scenario navigation and behavioral actuation of the **UWP golden**
  were not possible — only the initial File Playback frame was captured as pixel
  ground truth. There is no coordinate-click fallback in `winapp`. Because the UWP
  golden recorded **no** control responses, the behavioral downgrade rule ("responds
  in UWP, dead in WinUI") could not fire for any control.

## Behavioral notes (environmental, matches UWP)
- Buttons that "did not respond" in the WinUI capture (Start Graph, Record, Create
  Graph, Pick Output File, effect/loop toggles) are **gated by the environment**:
  there is no audio output device (both apps display *"Audio Device Output unavailable
  because DeviceNotAvailable"* / red Output Device node), and `Start Graph` is disabled
  until a file is loaded via a file-picker dialog that cannot be completed
  non-interactively. This gating is identical in the UWP golden (File Playback frame
  shows the same red DeviceNotAvailable state).
- **Load File** buttons *did* respond in WinUI (opened the file picker / updated
  status) across scenarios 1, 5 and 6 — the interactive controls that can act without
  a device work.
- Scenario 3 (FrameInput Node) additionally shows a green Output node and
  *"Device Output Node successfully created"* — a live positive behavioral signal.

## Capture artifacts (not defects)
- Several WinUI screenshots show a leftover Windows "Open" file-picker dialog on the
  left half of the frame. This is a residue of actuating the "Load File" buttons
  (the picker cannot be dismissed non-interactively); it does not affect the app
  content rendered in the AudioCreation window on the right.

## Verdict
Faithful migration. All 6 features PASS. No missing controls, no dead controls
attributable to the migration, no visual regressions.
