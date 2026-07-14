# Dev-agent slips — Background Activation (no skill change)

- **~30 nullable warnings** from UWP code under `<Nullable>enable</Nullable>`. Already covered prominently by the nullable guidance in `MIGRATION-PATTERNS.md`; non-blocking; a re-run would annotate them.
- **Numbered nav titles broke parity nav-by-title** → identical winui3 frames. This is an evaluation-tool (`winui3-parity-check`) limitation; the numbering faithfully matches the UWP titles and manual navigation confirmed all six scenarios render correctly. Changing the migration skill would reduce fidelity. Recorded for the human, not a skill edit.
