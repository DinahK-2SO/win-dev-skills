# Rubric — Linguistic services C# sample (scenario `LinguisticServices`)

Ground-truth feature list derived from the UWP source and used to grade the migrated
WinUI 3 app. Each scenario must (a) be reachable/render, (b) preserve every control,
and (c) preserve the control's behaviour vs the original UWP handler.

| # | Scenario | Controls (must be present) | Actions (must respond) |
|---|----------|----------------------------|------------------------|
| 1 | Language Detection | TextBox `TextInput`, Button `Go` "Detect Languages" | Detect Languages |
| 2 | Script Detection | TextBox `TextInput`, Button `Go` "Detect Scripts" | Detect Scripts |
| 3 | Transliteration | TextBox `TextInput`, Button `Go` "Transliterate" | Transliterate |
| 4 | Character Grouping | ComboBox `LanguageText`, Button "Get groups", ComboBox `CandidateText`, Button "Assign group", GridView `GroupingsGrid` | Get groups, Assign group |

Pass = renders + ≥80% control coverage + no behavioural regression vs UWP golden.
Partial = renders + ≥40% coverage, or a control present-but-dead vs UWP.
Fail = blank/unreachable or <40% coverage.
