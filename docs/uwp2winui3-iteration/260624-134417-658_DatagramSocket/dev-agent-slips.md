# Dev-agent slips — DatagramSocket (will NOT change skill)

## 1. Greedy regex corrupted its own alias line
- **Problem:** First fix used a too-greedy PowerShell `-replace` that rewrote the alias
  definition itself, needing a second cleanup pass.
- **Evidence:** session-log.txt:4466, :4498/:4529, :4552-4562.
- **Slip type:** one-off mistake (generic tooling technique, not migration knowledge).
- **Why no skill change:** a re-run would likely edit more carefully; the generalizable
  part (the CS0118 collision + clean alias fix) is captured as a skill-defect, which also
  steers the agent away from ad-hoc regex.
