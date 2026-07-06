# Skill coverage gaps — LampDevice

## 1. `Windows.UI.Colors` not auto-applied by bootstrap + missing struct/class distinction
- **Problem:** post-bootstrap build fails CS0234/CS0103 on `Colors` because only
  `Windows.UI.Xaml` is auto-rewritten.
- **Evidence:** session-log.txt:2806-2813 (errors), turns 36-37 (:2837, :2847, :2859 fixes).
- **Covered at:** MIGRATION-PATTERNS.md mapping table line 157; script rewrite line 126 —
  but the row is passive and un-applied.
- **Why missed:** under-emphasized / grey-zone — listed but not auto-applied, and no
  guidance on the `Colors` class vs `Color` struct trap.
- **Improvement:** Tier-1 extend the script to rewrite `Windows.UI.Colors`/`ColorHelper`
  (struct-safe); Tier-3 note the class-moved/struct-stayed rule under the mapping table.
- **Generalizes:** status-message coloring via `Colors.Red/Green` appears in nearly every
  UWP sample and app; the misses recur on every migration.
