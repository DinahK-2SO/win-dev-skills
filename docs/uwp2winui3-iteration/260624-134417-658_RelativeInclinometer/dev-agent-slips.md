# Dev-agent slips (skill already adequate → NO skill change)

## 1. Nullable-reference warnings (CS8618/CS8600/CS8602/CS8604)
- **Evidence:** `build-output.txt` tail — 10 warnings; build **SUCCEEDED**, score 100.
- **Slip type:** one-off / non-blocking.
- **Why no skill change:** warnings only, inherited from verbatim-copied UWP sources;
  no effect on build/run/parity. Not a generalizable defect.
