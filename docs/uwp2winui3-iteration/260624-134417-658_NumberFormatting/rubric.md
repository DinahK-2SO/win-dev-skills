# Parity Rubric — Number formatting C# sample

Scenario: **NumberFormatting** — 7 features. Each feature passes when the migrated
WinUI 3 page (a) is reachable via title-driven navigation, (b) exposes the same control
(a `Display` button) plus a Description block and an output area, and (c) actuating
`Display` produces correct, scenario-appropriate formatted output matching the UWP sample.

| # | Feature | Controls | Action | Pass criteria |
|---|---------|----------|--------|---------------|
| 1 | Percent and Permille Formatting | 1 | Display | Renders description + Display; output shows percent/permille + language-specific/Arabic-digit variants |
| 2 | Decimal Formatting | 1 | Display | Output shows decimal with/without grouping separators and fr-FR / ar digit substitution |
| 3 | Currency Formatting | 1 | Display | Output shows currency in default/US$/€/¥ with fractional & grouping variants |
| 4 | Number Parsing | 1 | Display | Output shows percent/decimal parse round-trips across current/ja-JP/fr-FR |
| 5 | Rounding and Padding | 1 | Display | Output shows significant-digit padding/rounding tables |
| 6 | Numeral System Translation | 1 | Display | Output shows Latn → HaniDec (Han) digit translation |
| 7 | Formatting/Translation using Unicode Extensions | 1 | Display | Output shows formatters/translator driven by Unicode extension tags |
