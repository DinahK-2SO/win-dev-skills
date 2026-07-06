# Skill defects — KeyCredentialManager (WILL change skill)

## 1. Project name == WinRT type name → CS0234 + cascading WMC9999 (absent)

- **Problem:** Project/root namespace `KeyCredentialManager` collides with WinRT
  `Windows.Security.Credentials.KeyCredentialManager`; unqualified static calls fail with
  `CS0234`, plus a scary `WMC1509`/`WMC9999` XAML internal error.
- **Evidence:** session-log turns 39–50; build-output `WMC9999: Object reference not set…`;
  agent: "our project is named KeyCredentialManager which conflicts with …KeyCredentialManager".
- **Skill state:** **absent.** Existing CS0234 coverage is only about stale `bin/obj` duplicate
  types; CS0104 covers Windows.UI vs Microsoft.UI ambiguity. Neither covers project-name vs
  WinRT-type-name collision, and `WMC9999` isn't mentioned at all.
- **Fix:** New subsection in *Common build errors after the namespace rewrite* — symptom, root
  cause, alias/fully-qualify fix, and the note that WMC9999 is a downstream cascade of the C#
  failure (not a XAML bug).
- **Generalizes:** UWP samples are named after their API; the collision recurs across scenarios.
