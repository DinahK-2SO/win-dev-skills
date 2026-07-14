# Discrepancies — AudioCategory (index 0)

- **Score:** 100% (10/10 pass). Builds: yes. Runs: yes.
- **Missing controls / dead controls / wrong text / layout diffs:** none.
- All 10 scenarios present with correct title, Description, live audio-filtered
  `Select Audio File` picker, and Play/Pause/Stop controls.

**Measurement note (out of scope for the migration skill):** the original UWP app hung on
its splash screen during scoring, so no live UWP golden baseline was captured; scoring
relied on the source-derived checklist + structural parity (Compare-Parity PASS 10/10).
This is an eval-side condition, not a migration defect.
