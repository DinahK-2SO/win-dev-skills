# Skill coverage gaps — Accelerometer (WILL change skill)

## 1. CS8618 on migrate-as-is DTO classes under Nullable-enable
- **Problem:** shared `SampleConfiguration.cs` `Scenario { Title; ClassType; }` DTO emits
  4× CS8618 under `<Nullable>enable</Nullable>`; agent needed an extra build/fix cycle.
- **Evidence:** session-log.txt turns 32-34 — "Build succeeded with 4 warning(s)" →
  edit adds `= string.Empty;` / `= typeof(object);` → 0 warnings.
- **Covered at:** MIGRATION-PATTERNS.md:166 mentions the nullable pattern **only** for the
  `App.MainWindow` static; the "Common build errors" section lists CS0104/CS0227/CS0246/CS0101
  but not CS8618.
- **Why missed:** under-emphasized — no general note for plain data classes.
- **Improvement:** add a brief CS8618 entry to the existing "Common build errors after the
  namespace rewrite" section (field initializers or `required`), citing the shared
  SampleConfiguration.cs `Scenario` DTO.
- **Generalizes:** the `Scenario` DTO ships in 87 samples' SampleConfiguration.cs; every
  scaffold enables nullable → same warning corpus-wide.
