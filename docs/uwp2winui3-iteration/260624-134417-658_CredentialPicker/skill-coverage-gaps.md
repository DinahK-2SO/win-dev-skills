# CredentialPicker — Skill Coverage Gaps (present but unclear → change skill)

## 1. Manifest guidance not addressable by its natural anchor
- **Evidence:** session-log 1751-1757 — `Get-MigrationPattern.ps1 -Anchor appxmanifest` →
  *"Anchor '#appxmanifest' not found"*; recovered via `-Anchor csproj` (line 1764).
- **Covered at:** MIGRATION-PATTERNS.md, manifest subsections nested under the `csproj`
  anchor with no id of their own.
- **Why missed:** not prominent (natural anchor name doesn't resolve).
- **Fix:** add `<a id="appxmanifest">` before the manifest subsections; SKILL.md Step 2 now
  fetches `-Anchor appxmanifest`.
- **Generalizes:** every packaged migration reconciles the manifest; the obvious anchor name
  should resolve on every scenario.

## 2. Nullable warnings from copied UWP code under-generalized
- **Evidence:** session-log 2522-2556 (CS8618/CS8600/CS8602 list), 2563 ("nullable
  annotations from the original code"), fixes at 1971/1986/2001.
- **Covered at:** the `## Windowing` nullable note (~line 186), but scoped only to the
  `App.MainWindow` field.
- **Why missed:** under-emphasized.
- **Fix:** generalize the existing note to all copied UWP code — static back-pointers
  (`MainPage.Current!`), unset auto-props (`Title`/`ClassType` → nullable/`required`),
  `sender`/`e` casts (null-check/forgive).
- **Generalizes:** the scaffold always enables `<Nullable>enable</Nullable>` and the shared
  SDK-sample SharedContent predates NRT, so these warnings recur on nearly every migration.
