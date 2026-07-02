# Dev-agent slips — will NOT change skill

## 1. Wasted turns polling slow builds
- **Problem:** turns 82-99 spent restarting `dotnet build` and polling long waits; ran out
  of turns before fixing errors.
- **Slip type:** one-off workflow/time-budget mistake.
- **Why no skill change:** generic tooling hygiene (redirect build output to a file, grep
  `error`) a capable model applies on re-run; fixing the two real skill defects removes
  most of the build/fix cycling. "Don't waste turns" prose would just bloat the skill.
