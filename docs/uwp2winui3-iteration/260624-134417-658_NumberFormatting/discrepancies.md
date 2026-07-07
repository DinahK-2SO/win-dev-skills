# Discrepancies — NumberFormatting (UWP → WinUI 3)

**Verdict: no functional discrepancies.** All 7 scenarios migrated with full structural
control coverage (1/1) and correct behavioral output. `Compare-Parity.ps1` = PASS, 100/100.

## Missing controls
None.

## Dead controls (respond in UWP, dead in WinUI)
None observed. Every scenario's `Display` button responds in the WinUI 3 app
(InvokePattern) and produces correct, scenario-specific formatted output. (A UWP
behavioral baseline could not be captured — see caveats — so no "dead vs UWP" downgrade
applies; nothing was flagged dead.)

## Wrong output text
None. Live actuation shows correct output per scenario, e.g.:
- 1 Percent/Permille: `Percent formatted: 99.24%`, `Permille formatted: 992.40‰`, Arabic-digit variant.
- 3 Currency: default ¥, US `$`, Euro `fr-FR`/`gd-IE`, fractional & grouping variants.
- 6 Numeral System: Latn → HaniDec (Han) digit translation.

## Layout differences
Not pixel-verifiable — see caveat 2. UIA structure matches the checklist exactly.

## Instrument caveats (not migration defects)
1. **UWP golden limited to launch frame.** The original UWP app launched
   (`uwp-app-runner` `ok:true`, pid 44468, title "Number Formatting C# Sample") and its
   initial frame was captured (109KB, correct). But the UWP **CoreWindow** (hosted by
   `ApplicationFrameHost`) exposes no traversable UIA tree to `winapp` on this host, so
   title-driven navigation and per-scenario/behavioral golden capture could not run.
2. **WinUI 3 screenshots blank.** The migrated app's screenshots capture blank (~13KB)
   due to a known WinUI 3 / DirectComposition `PrintWindow` limitation (the same
   instrument captured the UWP CoreWindow fine at 109KB). Rendering was confirmed present
   via the UIA tree (32 elements: NavigationView + all 7 scenarios + Description + Display
   + output, all on-screen) and live actuation (OutputTextBlock at real bounds
   625,607 1379x391 with correct text). Content and behavioral parity are confirmed;
   only pixel-level visual layout could not be independently verified.
