# Dev-Agent Slips — AppServices (will NOT change skill)

## 1. Mapping rows left at Status=copied
- **Problem:** Validator FAILed on 9 rows still `Status=copied`; agent bulk-flipped and
  re-ran (turns 35-37).
- **Covered clearly at:** SKILL.md Step 1 line 90 ("Flip Status from copied → done ... as
  each row is finished"), line 86 (migrate-as-is → flip to done), and Step 4 validator fix
  note line 167.
- **Slip type:** read-but-ignored (deferred the flip until the validator complained).
- **Why no skill change:** guidance is already prominent and duplicated; a re-run fixes it
  without any edit. More prose would only restate what is there.
