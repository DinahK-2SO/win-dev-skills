# Skill Coverage Gaps — Altimeter (→ will change skill)

### 1. Crash-code table: 0xC000027B does not list the init-order race
- **Evidence:** validator FAIL `0xc000027b` (session-log.txt:2524); startup-crashes anchor
  row says "unsupported ... defer it" (line 310); real fix was deferring navigation.
- **Covered at:** MIGRATION-PATTERNS.md line 310 (0xC000027B row) — but the init-order
  cause is attached only to the 0x80004003 row (line 307).
- **Why missed:** under-emphasized — native stowed codes are non-deterministic; the
  init-order race can surface under either code, but is listed under only one.
- **Fix:** add a cross-reference on the 0xC000027B row — rule out the navigate-in-constructor
  init-order race (#windowing) before deferring any API.
- **Generalizes:** every Frame-rooted sample can hit this; crash codes vary by machine/run.

### 2. Shell Conversion step does not forward-reference the inert-constructor rule
- **Evidence:** agent navigated in the MainWindow constructor (session-log.txt:2578) →
  crash → fixed to Activated-deferred nav. SKILL.md Shell Conversion (92-102) has no warning.
- **Covered at:** MIGRATION-PATTERNS.md 193-231 (#windowing); SKILL.md 92-102 omits a pointer.
- **Why missed:** not prominent at the decision point where the shell is built.
- **Fix:** one sentence in Shell Conversion — keep MainWindow constructor inert, defer the
  first Navigate until after Activate (link #windowing).
- **Generalizes:** applies to every Frame-rooted SDK-sample migration.
