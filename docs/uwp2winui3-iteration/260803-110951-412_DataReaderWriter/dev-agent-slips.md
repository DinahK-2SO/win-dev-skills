# Dev-agent slips — DataReaderWriter (index 0)

## 1. Rows left at `Status=copied` until final validation
- **Problem:** validator FAILed on 4 rows still `copied`; cost one extra edit +
  re-validate cycle.
- **Evidence:** session-log 2079-2090 (FAIL) → 2095-2100 (flip) → 2107-2123 (PASS).
- **Covered clearly at:** SKILL.md lines 86, 90, and Step 4 line 167; validator check at
  line 154.
- **Slip type:** read-but-ignored.
- **Why no skill change:** flipping as-you-go is already prominent and the mandatory
  validator deterministically catches misses; a re-run gets it right with no edit.
