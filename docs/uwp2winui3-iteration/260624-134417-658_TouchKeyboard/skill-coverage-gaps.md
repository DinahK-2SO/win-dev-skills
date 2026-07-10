# Skill coverage gaps — TouchKeyboard (WILL change skill)

## CG1 — InputPane.GetForCurrentView() missing from the replacement table
- **Problem:** InputPane show/hide events (Scenario2) + TryShow/TryHide (Scenario3) left
  as UWP-only code → WUI0004, runtime no-op.
- **Evidence:** `Scenario2_ShowHideEvents.xaml.cs(21,46)/(34,46)` and
  `Scenario3_ShowHideMethods.xaml.cs(53,19)/(43,27): warning WUI0004`.
- **Covered at:** `#getforcurrentview` replacement table (MIGRATION-PATTERNS.md 433-439),
  which the inventory routed to — but it has no InputPane row.
- **Why missed:** under-emphasized / incomplete table.
- **Improvement:** add row `InputPane.GetForCurrentView()` →
  `InputPaneInterop.GetForWindow(hwnd)` (`Windows.UI.ViewManagement.InputPaneInterop`).
- **Generalizes:** InputPane is the standard soft-keyboard API in every text-entry sample.

## CG2 — No rule against silencing WUI0004 with an empty try/catch
- **Problem:** all three files wrapped the failing GetForCurrentView() call in
  `try { ... } catch { }` → green build, muted analyzer, dead feature.
- **Covered at:** WUI0004 row (line 772) + table intro (line 431) say the APIs are
  UWP-only but never forbid catch-and-ignore.
- **Why missed:** not prominent — the wrong "fix" is never called out.
- **Improvement:** add a prominent rule: never mute GetForCurrentView()/WUI0004 with an
  empty try/catch; convert to the interop replacement, or delete the dead call.
- **Generalizes:** catch-and-ignore to appease the analyzer is a cross-scenario silent-
  no-op failure mode for any view-bound UWP API.
