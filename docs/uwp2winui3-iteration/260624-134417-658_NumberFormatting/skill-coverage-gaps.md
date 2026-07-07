# Skill coverage gaps — NumberFormatting

## 1. Nullable warnings after the namespace rewrite (CS8600/CS8601/CS8602/CS8629)  → WILL change skill

- **Problem:** First build emitted a cluster of nullable warnings; agent spent a dedicated
  cleanup pass. `CS8601` on `MainPage rootPage = MainPage.Current;` (Scenario6);
  `CS8629` ×9 on `INumberParser.ParseDouble(...).Value` (Scenario4).
- **Evidence:** session-log.txt:3443-3462, :3491, :3494, :3559-3565.
- **Already covered at:** MIGRATION-PATTERNS.md:268 — one inline comment in the *Windowing*
  section, scoped only to `App.MainWindow`.
- **Why missed:** buried / under-emphasized. The "Common build errors after the namespace
  rewrite" section (the natural triage spot) covers CS0104/CS0227/CS0101/CS0246 but not the
  CS86xx nullable class or its two dominant patterns.
- **Fix:** add a prominent subsection under "Common build errors after the namespace rewrite"
  naming the root cause (`<Nullable>enable</Nullable>` template vs nullable-oblivious UWP code),
  noting these are non-fatal warnings that don't fail the Validate gate, and giving the two
  patterns: (A) `MainPage.Current` → nullable local; (B) WinRT nullable-returning `Parse*`/
  `IReference<T>` → `?? <default>`, never unchecked `.Value`.
- **Generalizes:** the WinUI 3 template always enables nullable; the `MainPage.Current` static
  and nullable-returning WinRT APIs appear in essentially every Windows-universal-sample, so
  this warning cluster recurs across scenarios regardless of feature area.
