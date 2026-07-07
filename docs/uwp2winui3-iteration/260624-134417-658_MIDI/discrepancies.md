# Parity discrepancies — MIDI

Score **83**, builds=true, runs=true, **0 behavioral regressions**.

| Feature | Status | Skill gap? |
|---|---|---|
| S1 device enumeration page | pass | — |
| S1 list input devices | pass | — |
| S1 list output devices | pass | — |
| S1 auto-detect toggle | pass | — |
| S2 receive page | pass | — |
| S3 send page | partial | None — hardware-gated |
| S3 parameter controls (dynamic) | partial | None — identical collapsed XAML |
| S3 send/reset buttons | partial | None — matched non-responsive in UWP too |

**No visual discrepancies.** The only `partial` (Send MIDI Messages) is because the
deeper send path needs real MIDI hardware to exercise; the collapsed parameter controls
and disabled Send/Reset behave identically in the UWP golden. This is faithful parity,
**not** a migration defect — so it drives **no** skill change. The actionable finding is
tooling friction during development (see skill-defects), which the parity score does not
directly reflect.
