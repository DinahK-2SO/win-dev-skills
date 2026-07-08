# Skill Coverage Gaps — Printing (WILL change skill)

## 1. Blank-window guidance over-indexes on backdrop/title-bar triggers
- **Evidence:** Migrated `MainWindow.xaml` has none of the 3 composition triggers, yet all 6 scenarios blank; Validator Section 9 would PASS it.
- **Covered at:** MIGRATION-PATTERNS.md#system-backdrop-blank, SKILL.md blank-window section, Validate-UwpMigration.ps1 Section 9.
- **Why missed:** under-emphasized — "no opaque content-root background" is buried under the backdrop story instead of being a co-equal, checkable cause.
- **Improvement:** List "content root paints no opaque background" as a distinct blank cause and extend the Section 9 check to warn on `ApplicationPageBackgroundThemeBrush`.
- **Generalizes:** Makes the existing blank-window check catch the most common blank cause across migrations.
