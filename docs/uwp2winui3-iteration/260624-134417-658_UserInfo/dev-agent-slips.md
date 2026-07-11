# Dev-agent slips — UserInfo (NO skill change)

## Nullability warnings (non-issue)
- 14 CS86xx nullability warnings survived in the final build (build-output.txt), but the
  build **succeeded**, the app runs, and it scored **100/100**.
- These come from the scaffold enabling `<Nullable>enable</Nullable>` over SDK sample code
  written before nullable reference types. Cosmetic only.
- No skill change: a re-run scores identically; adding "annotate nullability" guidance to
  the migration skill would be pure noise with no behavioral payoff.
