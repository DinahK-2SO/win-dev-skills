# Skill coverage gaps (present but unclear → WILL change skill)

## 1. x:Bind DataTemplate `x:DataType` resolution failures (cascade + fallback)
- **Evidence:** `session-log.txt` L2370-2373 (`WMC0909`/`WMC1111`/`WMC1509`/`WMC9999` on
  `MainPage.xaml`); fixed turn 32 by switching `{x:Bind Title}` +
  `x:DataType="local:Scenario"` → `Text="{Binding Title}"`.
- **Covered at:** MIGRATION-PATTERNS.md `### x:Bind and compiled bindings` — mentions
  x:Bind support and `XLS0414`/`MC3074`, but nothing on DataTemplate `x:DataType`.
- **Why missed:** under-emphasized. No mention that these errors usually **cascade** from
  a prior code-behind compile failure (e.g. the CS0103 `App` error) aborting
  MarkupCompilePass, and no `{Binding}` fallback guidance.
- **Improvement:** add a paragraph: fix code-behind first (cascade), then correct
  `xmlns:local` or fall back to classic `{Binding}`.
- **Generalizes:** Every SDK-sample MainPage has a scenarios DataTemplate; the cascade
  behavior recurs whenever code-behind fails to compile.
