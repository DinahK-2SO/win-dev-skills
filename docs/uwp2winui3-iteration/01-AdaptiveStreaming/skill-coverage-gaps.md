# Skill Coverage Gaps — AdaptiveStreaming (iteration 1)

## 1. MediaPlayerElement zero-height in content-heavy pages

- **Category**: skill-coverage-gap (under-emphasized)
- **Evidence**: Requirements 3, 4, 7 partial. Screenshots show no MediaPlayerElement in scenarios 3, 4, 7.
- **Covered at**: SKILL.md Step 2 "Shell conversion" (lines 92-109) — recommends NavigationView+Frame; MIGRATION-PATTERNS.md line 569 covers MediaElement→MediaPlayerElement.
- **Why missed**: Shell conversion guidance focuses on navigation structure, not layout constraints. Doesn't warn about vertical space budget when Auto-height siblings overflow.
- **Proposed improvement**: Add MinHeight recommendation for media elements in `*` rows. Warn that NavigationView shell + status panels consume ~250px of viewport, which can collapse `*` rows to zero on content-heavy pages.
- **Generalizes**: Many UWP SDK samples use Auto/*/Auto Grid rows with MediaPlayerElement in the `*` row. NavigationView shell overhead systematically reduces available height.

## 2. Build output filtering warning incomplete (Select-String not mentioned)

- **Category**: skill-coverage-gap (not prominent)
- **Evidence**: session-log.txt L8265-8318 — Agent used `Select-String` to filter build output, hit same hanging issue the skill warns about for `Where-Object`. ~7 min wasted in polling loop.
- **Covered at**: SKILL.md Step 3 "Build command discipline" (lines 136-140) — warns about `Where-Object` swallowing output.
- **Why missed**: Warning names `Where-Object` but not `Select-String`. Agent used the equivalent cmdlet and hit the same trap.
- **Proposed improvement**: Generalize warning to "any filtering cmdlet (Where-Object, Select-String, Select-Object, etc.)".
- **Generalizes**: Agents reach for different PowerShell filtering cmdlets interchangeably. Naming only one leaves gaps.
