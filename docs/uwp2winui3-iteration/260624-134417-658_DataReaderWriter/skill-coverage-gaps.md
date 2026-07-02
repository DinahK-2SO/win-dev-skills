# Skill-coverage-gaps — DataReaderWriter (WILL change skill)

## 1. Namespace table under-emphasizes the struct-stays / helpers-move split
- **Problem:** `Windows.UI.Colors` sits in the "all `Windows.UI.Xaml.*` namespaces move"
  table with no caveat that the `Windows.UI.Color` struct (and `Point/Size/Rect`) stay.
- **Evidence:** `MIGRATION-PATTERNS.md:112`; dev-agent hit CS0234 keeping the old name
  (`session-log.txt:2231`).
- **Covered at:** MIGRATION-PATTERNS.md §Namespace Mapping (line 112).
- **Why missed:** under-emphasized.
- **Improvement:** add a one-line caveat (helpers `Colors`/`ColorHelper` move; the `Color`
  struct and `Point/Size/Rect` stay — no blanket `Windows.UI`→`Microsoft.UI` replace) and a
  `ColorHelper` row.
- **Generalizes:** the split trips up every color-using migration.
