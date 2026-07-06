# Dev-Agent Slips (skill already clear → NO skill change)

1. **Unix `head` in PowerShell (L282-287).** Generic shell slip; environment already
   states Windows/PowerShell. One-off mistake.

2. **Scenario 1 "3/8" structural false negative.** An evaluation-tool artifact
   (collapsed controls); the migration itself preserved all 5 controls with handlers and
   scored pass. Belongs to the eval skill (out of scope).

3. **All edits before first build (first build ~Turn 70/78).** SKILL.md Step 3 already
   prescribes a tight "build → fix first error → launch → repeat" loop and per-file
   BATCH/SEQUENTIAL "build immediately after each" modes. Read-but-ignored; no skill edit
   needed.
