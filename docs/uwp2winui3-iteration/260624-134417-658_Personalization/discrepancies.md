# Discrepancies — Personalization

**Score 100/100 · builds ✅ · runs ✅ · 1/1 feature pass**

No functional or structural parity gaps. The migrated WinUI 3 app reproduces the single
scenario (Pick and set lock screen image) with correct controls, verbatim description
text, and a live picker action.

| # | Requirement | Status | Note |
|---|-------------|--------|------|
| 0 | Pick and set lock screen image | pass | 2/2 controls in UIA tree, button opened Windows file picker (+74 tokens) |

**Only observation (not a defect):** the WinUI window client area screenshotted blank in
the non-interactive scoring session — an eval-side DirectComposition/PrintWindow capture
limitation. UIA tree + successful picker invocation confirm the app renders and functions.

Because parity is clean, the improvement evidence comes from the dev-agent's build log
(see `lessons.md`): a WMC0909 XAML-error cascade from a C# compile error, and manual
`SDKTemplate`→project namespace reconciliation the bootstrap does not automate.
