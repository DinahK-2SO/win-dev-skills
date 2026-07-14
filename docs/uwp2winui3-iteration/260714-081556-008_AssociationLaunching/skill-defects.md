# Skill-defects — AssociationLaunching (WILL change skill)

## 1. WUI1xxx advisory family undocumented + "no false positives" claim wrong
- **Evidence:** `build-output.txt` L9-10 — `warning WUI1001` on `Scenario1_LaunchFile.xaml.cs(121,54)` and `(151,54)`, the exact call sites where the agent had already added `WindowNative.GetWindowHandle` + `InitializeWithWindow` (same file L117-118, L148-149). Picker worked (parity pass).
- **Skill state:** *wrong* — PATTERNS.md WUI section listed only `WUI0002/0003/0004` and asserted "the analyzer does not produce false positives."
- **Root cause:** WUI1001 is a *syntactic* advisory on the WinRT picker type; it persists after the correct interop and is benign — not runtime-crash residue.
- **Fix (applied):** Split WUI section into Class 1 `WUI000x` (must fix) vs Class 2 `WUI1xxx` advisories (benign, don't chase); scope the "no false positives" line to `WUI000x`; cross-ref `#pickers`.
- **Generalizes:** Pickers/Share/Print surfaces are in a large share of UWP samples; all emit WUI1001.

## 2. Validator hard-FAILs on any WUI warning (incl. correct-picker WUI1001)
- **Evidence:** `Validate-UwpMigration.ps1` L436/L443 — `\bwarning\s+WUI\d+:` → FAIL if any. session-log L3050/L3080 validator reported "0 WUI analyzer warnings" while `winapp build` showed WUI1001 (ruleset mismatch).
- **Skill state:** *wrong* — gate did not separate fatal WUI000x from benign WUI1xxx.
- **Fix (applied):** FAIL only on `WUI000x`; report other `WUIxxxx` interop advisories as WARN; note winapp build is the authoritative WUI surface.
- **Generalizes:** Prevents false FAILs that would push agents to break working interop across many scenarios.
