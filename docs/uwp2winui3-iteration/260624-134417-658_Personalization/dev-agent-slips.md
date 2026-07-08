# Dev-agent slips — Personalization (will NOT change skill)

## 1. Duplicated `App` class body from a botched in-place edit (CS0102/CS0111)
- **Slip type:** one-off mistake. An edit doubled the entire `App` class body.
- **Self-corrected:** the agent recognized it at turn 35 ("the edit accidentally doubled
  the class"), removed the duplicate, and rebuilt clean at turn 36.
- **Covered clearly at:** SKILL.md line 181 edit-in-place / no-wholesale-overwrite rule.
- **Why no skill change:** a mechanical edit malfunction, not a guidance gap; a re-run would
  not reliably reproduce it, and "don't duplicate your class" prose would only add noise.
