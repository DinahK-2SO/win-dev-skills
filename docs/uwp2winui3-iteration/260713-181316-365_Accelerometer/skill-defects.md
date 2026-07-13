# Skill defects (will change skill) — Accelerometer

1. **Leftover `*.GetForCurrentView()` silenced with try/catch slips every gate.**
   - Evidence: build-output.txt L24 (WUI0004 on DisplayInformation), Scenario4 L47-55 (try/catch),
     Validate log L3504/L3521 (both PASS).
   - State: **absent** — residue grep skips `adaptable` patterns (Validate L69-70), validator
     `dotnet build` lacks the analyzer, no anti-silencing rule.
   - Fix: add `residueOnly` pattern `\.GetForCurrentView\s*\(` to the inventory; add a "replace, never
     silence" line to the GetForCurrentView section.
   - Generalizes: all 5 UWP per-view singletons; the try/catch escape is a generic dead-feature anti-pattern.

2. **WUI0004 guidance is wrong / DisplayInformation orientation missing.**
   - Evidence: MIGRATION-PATTERNS.md L515 (SystemNavigationManager-only symptom) and L262 (DPI-only);
     the real WUI0004 was DisplayInformation; Scenario4 needs CurrentOrientation/OrientationChanged.
   - State: **wrong**.
   - Fix: generalize the WUI0004 symptom to any `*.GetForCurrentView()`; split DisplayInformation into
     DPI vs orientation members in the replacements table.
   - Generalizes: every migration touching any GetForCurrentView singleton.

3. **CS0118 namespace-vs-type collision not covered.**
   - Evidence: session-log L3114 (`Accelerometer is a namespace but is used like a type`); fix = using
     alias (Scenario4 L7).
   - State: **absent** (grep for CS0118 / alias / namespace collision → no matches).
   - Fix: add a CS0118 entry recommending a `using` alias / fully-qualified type when the project name
     equals a WinRT type.
   - Generalizes: all SDK samples named after their API (Compass, Gyrometer, Barometer, ProximitySensor…).
