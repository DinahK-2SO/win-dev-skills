# OCR — Dev-Agent Slips (will NOT change skill)

## 1. `WMC0909 Cannot resolve DataType local:Scenario` (namespace mismatch)
- **Evidence:** session-log turn 42; reconciled to `SDKTemplate` namespace.
- **Covered at:** `PATTERNS.md` "x:Bind and compiled bindings" (line 808) — "look for stale
  UWP namespace prefixes"; SKILL.md shell-conversion/fidelity guidance.
- **Slip type:** one-off mistake. Standard XAML; resolvable from the compiler error alone.

## 2. `DisplayInformation.GetForCurrentView()` → `CS0103 displayInformation undefined`
- **Evidence:** session-log turns 46–48; file carried injected
  `TODO[migrate-…]: see PATTERNS.md#getforcurrentview`.
- **Covered at:** `PATTERNS.md#getforcurrentview` (394–422) with a dedicated
  "DisplayInformation is view-bound" subsection + replacement table.
- **Slip type:** read-but-ignored, later fixed. Skill already prominent — no change.
