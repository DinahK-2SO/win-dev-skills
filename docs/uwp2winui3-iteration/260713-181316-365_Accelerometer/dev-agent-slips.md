# Dev-agent slips (NO skill change) — Accelerometer

1. **First validate: 8 rows Status=copied** — SKILL.md Step 4 already makes the PASS gate and the
   `Status=copied` check prominent; agent fixed on re-run. (one-off)
2. **Transient CS8803/CS0106/CS1022** from a malformed edit — recovered by the standard build loop.
   (one-off)
3. **Splash-sdk.png manifest reference** — Validate Section 5 already checks manifest images; agent
   resolved it before the final PASS. (one-off)

All three are covered clearly/prominently by existing skill+validator content; a capable re-run
fixes them with no skill edit.
